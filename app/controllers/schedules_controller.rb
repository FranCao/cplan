class SchedulesController < ApplicationController
  def index
    @courses = CoursesOffering.where(semester: 'Summer')
  end
end
