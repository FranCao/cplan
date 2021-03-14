class SessionsController < ApplicationController
  # skip_before_action :require_login

  def index
  end

  def omniauth
    @student = Student.from_omniauth(auth)
    @student.save
    session[:student_id] = @student.id
    redirect_to student_path(@student)
  end

  private

  def auth
    request.env['omniauth.auth']
  end
  
end
