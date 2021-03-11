class StudentsController < ApplicationController
	# skip_before_action :require_login, only: [:create]
	protect_from_forgery with: :null_session
	# after sso, if a student does not have our profile, create it
	def create
		begin
			@student = Student.create!(student_params)
		rescue Exception => e
			puts e
		end
		render json: true
	end

	# when user add info, need to add `add_related_class`
	def edit
		@uid = params[:id]
		@student = Student.find_by(uid: @uid)
	end

	def update
		@uid = params[:id]
		@student = Student.find_by(uid: @uid)
		@student.update_attributes!(student_params)
	end

	private

	def student_params
		params.require(:student).permit(
			:uid,
			:last_name,
			:first_name,
			:email,
			:degree,
			:track,
			:graduation_semester,
			:graduation_year,
			:initial_total_credit
		)
	end

	# pending
	def related_class_params
	end
end
