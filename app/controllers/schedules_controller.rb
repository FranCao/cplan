class SchedulesController < ApplicationController
  def index
    @courses = CoursesOffering.where(semester: 'Summer')
    @student = session[:student_id]
  end

  def show
		id = params[:id]
		@student = Student.find(id)
		if @student.graduation_year == nil || @student.graduation_year.nil?
			redirect_to edit_student_path(@student)
		end
	end
end
