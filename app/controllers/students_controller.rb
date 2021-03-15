class StudentsController < ApplicationController
	# skip_before_action :require_login, only: [:create]
	protect_from_forgery with: :null_session

	# def index
	# 	@students = Student.all
	# end

	def show
		id = params[:id]
		@student = Student.find(id)
		if @student.graduation_year == nil or @student.graduation_year.nil?
			redirect_to edit_student_path(@student)
		end
	end

	def create
		@student = Student.create!(student_params.to_h)
		flash[:notice] = "#{@student.first_name} #{@student.last_name} was successfully created."
		@student = Student.find_by_email(@student.email)
		redirect_to student_path(@student)
	end

	def new
		id = params[:id]
		@student = Student.find_by(id)
	end

	# when user add info, need to add `add_related_class`
	def edit
		id = params[:id]
		@student = Student.find(id)
	end

	def update
		@student = Student.find params[:id]
		params[:student].keys.each do |key|
			@student.update!(key => params[:student][key])
		end
		flash[:notice] = "#{@student.first_name} #{@student.last_name} was successfully updated."
		redirect_to student_path(@student)
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
