class AdminController < ApplicationController
  before_action :require_login
  before_action :is_admin?
  
  def new
  end

  def index
    @courses = Course.all.order(:course_number)
  end

  def edit
    @course = Course.find(params[:course_id])
  end

  # def destroy
  #   @course = Course.find(params[:course_id])
  #   @course.destroy
  #   redirect_to admin_path
  # end

  def add
    @course = Course.create!(course_params)
    flash[:notice] = "#{@course.course_identifier} was successfully added."
    redirect_to admin_path
  end

  def update
    @course = Course.find(params[:course_id])
    @course.update(course_params)
    flash[:notice] = "#{@course.course_identifier} was successfully updated."
    redirect_to edit_course_path(@course)
  end

  private
  def course_params
    params.require(:course).permit(:call_number, :subject, :course_number, :course_identifier, :course_name)
  end

end
