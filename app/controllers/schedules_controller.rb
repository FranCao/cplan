class SchedulesController < ApplicationController
  def index
    @courses = CoursesOffering.where(semester: 'Summer')
    @student = session[:student_id]
    # s = CoursesOffering.joins("INNER JOIN schedules ON schedules.courses_offering_id = courses_offerings.id AND courses_offerings.semester = 'Summer'").select('courses_offerings.*, schedules.student_id')
    s = Schedule.joins("INNER JOIN courses_offerings ON courses_offerings.id = schedules.courses_offering_id")
    s = s.distinct.pluck(:courses_offering_id)
    @schedule = CoursesOffering.where(id: s).and(CoursesOffering.where(semester: 'Summer'))
  end

  def add
    @course = params[:courses_offering_id]
    @student = session[:student_id]
    # @schedule = Schedule.find_or_create_by(:student_id => @student, :courses_offering_id => @course)
    Schedule.where(student_id: @student, courses_offering_id: @course).first_or_create
  end

  def destroy
    @course = params[:courses_offering_id]
    @student = session[:student_id]
    Schedule.where(student_id: @student, courses_offering_id: @course).delete_all
    flash[:success] = "Course removed from schedule."
  end

end
