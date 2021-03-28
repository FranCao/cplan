class StudentsController < ApplicationController
	# skip_before_action :require_login, only: [:create]
	protect_from_forgery with: :null_session
	before_action :require_login

	def index
		@students = Student.all
	end

	def show
		id = params[:id]
		@student = Student.find(id)
		# if @student.graduation_year == nil or @student.graduation_year.nil?
		if @student.graduation_year == nil || @student.graduation_year.nil?
			redirect_to edit_student_path(@student)
		end
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
		# @student.track_id = Track.find(@student.track_id).name
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
end
