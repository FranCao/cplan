class SchedulesController < ApplicationController
  def index
    @courses = CoursesOffering.where(semester: 'Summer')
    @student = session[:student_id]
  end

  def show
    @courses = CoursesOffering.where(semester: 'Summer')
		# @student = session[:student_id]
	end
end
