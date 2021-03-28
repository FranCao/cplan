require 'rails_helper.rb'

describe SessionsController, type: :controller do
    before do
        request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
    end

    describe '#GET #omniauth' do
        it "should successfully create a session" do
            session[:student_id].should be_nil
            get :omniauth
            session[:student_id].should_not be_nil
        end
    end

    describe '#DELETE #destroy' do
        it 'redirects to home page' do
            delete :destroy
            expect(response).to redirect_to home_path
        end
        it 'should flash a message when loged out' do
            delete :destroy
            # should have_selector('div.flash', text: 'You have successfully logged out')
            # expect(flash[:success]).to match(/You have successfully logged out*/)
        end

        it 'clears the session' do
            delete :destroy
            session[:student_id].should be_nil
        end
    end
end