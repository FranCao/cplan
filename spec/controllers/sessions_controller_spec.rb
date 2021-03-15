require 'rails_helper.rb'

describe SessionsController, type: :controller do
    describe '#DELETE #destroy' do
        @student_info = {email: "fake@google.com", last_name: "Fake", first_name: "Student"}
        # Student.stub(:create!).with(@student_info).and_return(Student.new(@student_info))
        # Student.stub(:find_by_email).with("fake@google.com").and_return(Student.new({id:'12'}))

        it 'logs the user out and clears the session' do
            delete :destroy
            expect(response).to redirect_to home_path
        end
    end
end