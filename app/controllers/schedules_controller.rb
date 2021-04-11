class SchedulesController < ApplicationController
  # helper_method :parseTime
  # skip_before_action :require_login, :raise => false
  # skip_before_action :require_login, only: [:index]
  # before_action :require_login

  def show
    @courses = CoursesOffering.where(semester: 'Summer')
    @studentID = session[:student_id]
    # s = CoursesOffering.joins("INNER JOIN schedules ON schedules.courses_offering_id = courses_offerings.id AND courses_offerings.semester = 'Summer'").select('courses_offerings.*, schedules.student_id')
    s = Schedule.joins("INNER JOIN courses_offerings ON courses_offerings.id = schedules.courses_offering_id").where(student_id: @studentID)
    c = s.distinct.pluck(:courses_offering_id)

    @student = Student.find(@studentID)
    @taken_courses = @student.courses
    @trackID = @student.track_id
    @track = Track.find(@trackID)
    @trackReq = @track.trackRequirements

    @offer_taken = Array.new
    @offer_breadth = Array.new
    @offer_elective = Array.new
    @offer_required = Array.new

    @taken = params[:Taken]
    @breadth = params[:Breadth]
    @elective = params[:Elective]
    @require = params[:Require]

    @courses.each do |course|
      @taken_courses.each do |taken|
        if course.course_identifier == taken.course_identifier && @offer_taken.exclude?(course) then
          @offer_taken << course
        end
      end
      @trackReq.each do |tq|
        if (tq.is_systems_breadth_requirement || tq.is_theory_breadth_requirement || tq.is_aiapplications_breadth_requirement) && @offer_breadth.exclude?(course) then
          @offer_breadth << course
        end
      end
      @trackReq.each do |tq|
        if tq.is_required && @offer_required.exclude?(course) then
          @offer_required << course
        end
      end
      @trackReq.each do |tq|
        if tq.is_general_elective && @offer_elective.exclude?(course) then
          @offer_elective << course
        end
      end
    end

    @courses_filter = @courses

    if !@taken then
      @courses_filter = (@courses_filter - @offer_taken).uniq
    end
    if !@breadth then
      @courses_filter = (@courses_filter - @offer_breadth).uniq
    end
    if !@require then
      @courses_filter = (@courses_filter - @offer_required).uniq
    end
    if !@elective then
      @courses_filter = (@courses_filter - @offer_elective).uniq
    end

    @schedule = CoursesOffering.where(id: c).and(CoursesOffering.where(semester: 'Summer'))
    
  end

  def add
    @course = params[:courses_offering_id]
    @student = session[:student_id]
    # @schedule = Schedule.find_or_create_by(:student_id => @student, :courses_offering_id => @course)
    Schedule.where(student_id: @student, courses_offering_id: @course).first_or_create
    redirect_back(fallback_location: schedule_path(@student))
  end

  def destroy
    @course = params[:courses_offering_id]
    @student = session[:student_id]
    Schedule.where(student_id: @student, courses_offering_id: @course).delete_all
    # flash[:success] = "Course removed from schedule."
    redirect_back(fallback_location: schedule_path(@student))
  end

end
