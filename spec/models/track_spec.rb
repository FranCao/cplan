require 'rails_helper'

RSpec.describe Track, type: :model do
  describe "track relations" do
    it "should have many students" do
        relation = Track.reflect_on_association(:students)
        expect(relation.macro).to eq(:has_many)
    end

    it "should have many track requirements" do
        relation = Track.reflect_on_association(:trackRequirements)
        expect(relation.macro).to eq(:has_many)
    end
  end
end
