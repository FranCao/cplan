class StudentsController < ApplicationController
	# skip_before_action :require_login, only: [:create]
	protect_from_forgery with: :null_session
	before_action :require_login

	def show
		id = params[:id]
		@student = Student.find(id)

		if @student.graduation_year.nil? || @student.graduation_year == nil
			flash[:notice] = "Please type your graduation year"
			redirect_to edit_student_path(@student)
			return
		end

		if @student.track_id.nil? || Track.find(@student.track_id).name == "Undecided"
			flash[:notice] = "Please select a valid track"
			redirect_to edit_student_path(@student)
			return
		end


		@taken_courses = @student.courses
		@track = Track.find(@student.track_id)

		@system_req, @theory_req, @ai_req, @breadth_extra, @required_req, @general_req, @track_elective_req, @breadth_req = build_requirements(@taken_courses, @track)
		
		# puts @theory_req
		
		@track_req = [
			{"name": "Required", "info": @required_req},
			{"name": "Track elective","info": @track_elective_req},
			{"name": "General elective","info": @general_req},
		]

	end

	def create
		@student = Student.create!(student_params.to_h)
		flash[:notice] = "#{@student.first_name} #{@student.last_name} was successfully created."
		@student = Student.find_by_email(@student.email)
		redirect_to student_path(@student)
	end

	# def new
	# 	id = params[:id]
	# 	@student = Student.find_by(id)
	# end

	# when user add info, need to add `add_related_class`
	def edit
		id = params[:id]
		@student = Student.find(id)
		if @student.track_id
			@selected_track = Track.find(@student.track_id).name
		end
		@selected_major = @student.major
		@selected_semester = @student.graduation_semester
		@trackNames = Track.pluck(:name)
		if @trackNames.empty?
			@trackNames = ["Software Systems", "Machine Learning"]
		end
	end

	def update
		@student = Student.find params[:id]

		if !params[:course].nil?
			@student.courses << Course.where(id: params[:course][:id])
			redirect_to edit_student_path(@student)
		else
			params[:student].keys.each do |key|
				if key == "track_id"
					begin
						params[:student][:track_id] = Track.find_by_name(params[:student][:track_id]).id
					rescue
						params[:student].delete(:track_id)
					end
				end
				@student.update!(key => params[:student][key])
				flash[:notice] = "#{@student.first_name} #{@student.last_name} was successfully updated."
			end
			redirect_to student_path(@student)
		end
	end

	def remove_course
		@student = Student.find params[:id]
		@course = Course.where(id: params[:course_id])
		@student.courses.delete(@course)
		redirect_to edit_student_path(@student)
	end

	# def destroy
	# 	@student = Student.find(params[:id])
	# 	@student.destroy
	# 	flash[:notice] = "Student '#{@student.first_name} #{@student.last_name}' deleted."
	# 	redirect_to students_path
	#   end

	private

	def student_params
		params.require(:student).permit(
			:last_name,
			:first_name,
			:email,
			:degree,
			:track,
			:graduation_semester,
			:graduation_year,
			:initial_total_credit
		)
	end

	def build_requirements(taken_courses, track)
		track_requirements = Track.find(@student.track_id).trackRequirements
		@system_req =  {"name": "Breadth Requirement System Group", "satisfied": false, "courses_pending": [], "courses_completed": []}
		@theory_req = {"name": "Breadth Requirement Theory Group", "satisfied": false, "courses_pending": [], "courses_completed": []}
		@ai_req = {"name": "Breadth Requirement AI & Applications Group", "satisfied": false, "courses_pending": [], "courses_completed": []}
		@breadth_extra = {"name": "Breadth Extra", "satisfied": false, "courses_pending": [], "courses_completed": []}

		@required_req = {"name": "Required Courses", "satisfied": false, "courses_pending": [], "courses_completed": []}
		
		@general_req = {"name": "General Elective", "satisfied": false, "courses_completed": [], "courses_completed": []}

		@track_elective_req = {"name": "Track Elective", "satisfied": false, "courses_pending": [], "courses_completed": []}

		@breadth_req = {"name": "Breadth Requirements", "satisfied": false, "groups":[
			{"name": "Theory", "info":@theory_req}, 
			{"name":" System", "info":@system_req}, 
			{"name":"AI & Applications", "info":@ai_req}
		]}
		general_electives = taken_courses.clone

		track_requirements.each do |requirement|
			course = Course.find(requirement.course_id)
			completed = taken_courses.include?(course)
			general_electives -= [course]

			if requirement.is_required 
				@required_req, general_electives = add_course_to_req(course, @required_req, completed, general_electives)
			elsif requirement.is_aiapplications_breadth_requirement 
				@ai_req, general_electives = add_course_to_req(course, @ai_req, completed, general_electives)
			elsif requirement.is_systems_breadth_requirement 
				@system_req, general_electives = add_course_to_req(course, @system_req, completed, general_electives)
			elsif requirement.is_theory_breadth_requirement 
				@theory_req, general_electives = add_course_to_req(course, @theory_req, completed, general_electives)
			elsif !@breadth_extra[:satisfied] && @system_req[:satisfied] && @ai_req[:satisfied] && @theory_req[:satisfied]
				@breadth_extra, general_electives = add_course_to_req(course, @breadth_extra, completed, general_electives)
			elsif requirement.is_general_elective 
				@general_req, general_electives = add_course_to_req(course, @general_req, completed, general_electives)
			end
			@general_req[:courses_completed] = general_electives.clone
			@system_req, @theory_req, @ai_req, @breadth_extra, @required_req, @general_req, @track_elective_req, @breadth_req = update_satisfied(@track, @system_req, @theory_req, @ai_req, @breadth_extra, @required_req, @general_req, @track_elective_req, @breadth_req)
		end 
		

		return @system_req, @theory_req, @ai_req, @breadth_extra, @required_req, @general_req, @track_elective_req, @breadth_req
	end

	def add_course_to_req(course, req, completed, general_electives)
		if completed 
			if !req[:satisfied]
				req[:courses_completed] << course
			else
				general_electives += [course]
			end
		else
			req[:courses_pending] << course
		end
		return req, general_electives
	end


	def update_satisfied(track, system_req, theory_req, ai_req, breadth_extra, required_req, general_req, track_elective_req, breadth_req)
		if @required_req[:courses_pending].empty?
			@required_req[:satisfied] = true 
		end

		if !@track.number_of_track_electives.nil?
			number_of_track_electives = @track.number_of_track_electives
		else
			number_of_track_electives = 2
		end

		if !track.number_of_general_electives.nil?
			number_of_general_electives = track.number_of_general_electives
		else
			number_of_general_electives = 2
		end

		if track_elective_req[:courses_completed].length() >= number_of_track_electives
			@track_elective_req[:satisfied] = true 
		end
		if @general_req[:courses_completed].length() >= number_of_general_electives
			@general_req[:satisfied] = true 
		end

		if @system_req[:courses_completed].length() >= 1
			@system_req[:satisfied] = true 
		end
		if @theory_req[:courses_completed].length() >= 1
			@theory_req[:satisfied] = true 
		end
		if @ai_req[:courses_completed].length() >= 1
			@ai_req[:satisfied] = true 
		end
		if @breadth_extra[:courses_completed].length() >= 1
			@breadth_extra[:satisfied] = true 
		end


	   return @system_req, @theory_req, @ai_req, @breadth_extra, @required_req, @general_req, @track_elective_req, @breadth_req
	end
end
