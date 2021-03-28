class ApplicationController < ActionController::Base

  include ApplicationHelper
  protect_from_forgery with: :exception
  if Rails.env.test?
    prepend_before_action :stub_current_student
    def stub_current_student
      if !ENV["stub_student_id"].nil?
        session[:student_id] = ENV["stub_student_id"] 
      end
    end
  end
  @student = :current_user

end
