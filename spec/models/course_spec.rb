require 'rails_helper'

RSpec.describe Course, type: :model do
	describe "Course relations" do
		it "should has many track requirement" do
			relation = Course.reflect_on_association(:trackRequirements)
			expect(relation.macro).to eq(:has_many)
		end
	end
end
