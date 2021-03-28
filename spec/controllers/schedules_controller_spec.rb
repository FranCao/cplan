require 'rails_helper'

describe SchedulesController, :type => :controller do

	describe 'index' do
        it 'get all courses' do
            get :index
            expect(response).to render_template("index")
        end
    end

	describe 'add' do
		it "add to schedule" do
			post :add, params:{student_id: "2", courses_offering_id: "1"}
			expect(Schedule.where(student_id: "2", courses_offering_id: "1")).to be_truthy
		end
    end

	describe 'destroy' do
		it "remove from schedule" do
			post :destroy, params:{student_id: "2", courses_offering_id: "1"}
			expect(Schedule.where(student_id: "2", courses_offering_id: "1").length).to eq(0)
		end
	end

end