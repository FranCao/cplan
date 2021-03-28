class SessionsController < ApplicationController
  # before_action :require_login, except: [:index, :omniauth, :auth]

  def index
  end

  def omniauth
    @student = Student.from_omniauth(auth)
    @student.save
    session[:student_id] = @student.id
    redirect_to student_path(@student)
  end

  # logout
  def destroy
    if logged_in?
      session.clear
      flash[:success] = 'You have successfully logged out'
    else
      flash[:error] = 'You were never logged in'
    end      
    redirect_to home_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
  
end
