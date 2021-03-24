class SchedulesController < ApplicationController
  def index
    @courses = Course.where(semester: 'Summer')
  end
end
