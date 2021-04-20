require 'rails_helper'

describe SchedulesController, :type => :controller do
	# before do
    #     request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
	# 	get :omniauth
    # end

	describe 'show' do
        it 'get all course offerings for the next semester and display schedule' do
            get :show, params:{student_id: 1}
            expect(response).to render_template("show")
        end
    end

	describe 'add' do
		it "add to schedule" do
			post :add, params:{student_id: 1, courses_offering_id: 1}
			expect(Schedule.where(student_id: 1, courses_offering_id: 1)).to be_truthy
		end
    end

	describe 'destroy' do
		it "remove from schedule" do
			post :destroy, params:{student_id: 1, courses_offering_id: "1"}
			expect(Schedule.where(student_id: 1, courses_offering_id: "1").length).to eq(0)
		end
	end

end