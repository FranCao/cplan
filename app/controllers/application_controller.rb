class ApplicationController < ActionController::Base

  include ApplicationHelper
  protect_from_forgery with: :exception
  if Rails.env.test?
    prepend_before_action :stub_current_student
    def stub_current_student
      flash[:notice] = "this line is run #{ENV["stub_student_id"]}"
      session[:student_id] = ENV["stub_student_id"] if ENV["stub_student_id"]
    end
  end
  @student = :current_user

end
