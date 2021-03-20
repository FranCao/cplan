require 'rails_helper'

RSpec.describe TrackRequirement, type: :model do
	describe "track requirement relations" do
		it "should belongs_to a track" do
			relation = TrackRequirement.reflect_on_association(:track)
			expect(relation.macro).to eq(:belongs_to)
		end

		it "should belongs_to a course" do
			relation = TrackRequirement.reflect_on_association(:course)
			expect(relation.macro).to eq(:belongs_to)
		end
	end
end
