require 'rails_helper'

describe SchedulesController, :type => :controller do
	
	describe 'add' do
		it "add to schedule" do
			# @schedule_info = {student_id: "2", courses_offering_id: "1"}
			# Schedule.stub(:add).with(@schedule_info)
			post :add, params:{student_id: "2", courses_offering_id: "1"}
		end
    end

	describe 'destroy' do
		it "remove from schedule" do
		end
	end

end