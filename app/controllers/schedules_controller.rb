class SchedulesController < ApplicationController
  helper_method :parseTime
  
  def index
    @courses = CoursesOffering.where(semester: 'Summer')
  end
end
