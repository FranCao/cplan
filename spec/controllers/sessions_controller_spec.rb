require 'rails_helper.rb'

describe SessionsController, type: :controller do
    before do
        request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
    end

    describe '#GET #omniauth' do
        it "should successfully create a session" do
            session[:student_id].should be_nil
            get :omniauth, provider: :google_oauth2
            session[:student_id].should_not be_nil
        end
    end

    describe '#DELETE #destroy' do
        it 'redirects to home page' do
            delete :destroy
            expect(response).to redirect_to home_path
        end

        # it 'clears the session' do
        #     session[:email].should_not be_nil
        #     delete :destroy
        #     session[:email].should be_nil
        # end
    end

    # describe '#GET #auth' do
    #     it 'brings the user to the google authentication page' do
    #         get :auth=>:provider/callback
    #         # expect(response).to redirect_to auth_failure_path
    #     end
    # end
end