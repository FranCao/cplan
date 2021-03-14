require 'rails_helper.rb'

describe CoursesController, type: :controller do
    describe 'index' do
        it 'get all courses' do
            get :index
            expect(response).to be_success  
        end
    end
end