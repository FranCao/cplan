require 'rails_helper.rb'

describe SessionsController, type: :controller do
    describe '#DELETE #destroy' do
        it 'logs the user out and clears the session' do
            delete :destroy, id: 1
            expect(response).to redirect_to home_path
        end
    end
end