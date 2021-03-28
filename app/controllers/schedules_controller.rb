module SchedulesHelper
  def parseTime(t)
      return t.strftime("%I:%M %p") 
  end
end

class SchedulesController < ApplicationController
  # helper_method :parseTime
  # skip_before_action :require_login, :raise => false
  # skip_before_action :require_login, only: [:index]
  before_action :require_login

  def index
    @courses = CoursesOffering.where(semester: 'Summer')
    # @student = Student.find params[:id]
  end
end
