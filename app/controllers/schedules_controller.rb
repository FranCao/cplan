class SchedulesController < ApplicationController
  def index
    @courses = CoursesOffering.where(semester: 'Summer')
    @student = session[:student_id]
    @schedule = Schedule.where(student_id: @student)
  end

  def add
    @course = params[:courses_offering_id]
    @student = session[:student_id]
    @schedule = Schedule.find_or_create_by(:student_id => @student, :courses_offering_id => @course)
  end

  def remove
  end

end
