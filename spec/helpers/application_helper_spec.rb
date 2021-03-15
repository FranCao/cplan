require 'rails_helper'

describe ApplicationHelper do 

    describe '#current_user' do
        it 'returns the current user' do
            assign(:current_user, 'Fake Student')
            helper.current_user.should eql('Fake Student')
        end
    end

end