require 'rails_helper'

RSpec.describe SchedulesHelper, type: :helper do

  describe "parseTime" do
    it "parseTime should work when not nil" do
      expect(helper.parseTime(DateTime.new(2021,5,3,10,10))).to eq("10:10")
    end
    it "parseTime should work when nil" do
      expect(helper.parseTime(nil)).to eq("")
    end
  end

  describe "parseTimePretty" do
    it "parseTimePretty should work" do
      expect(helper.parseTimePretty(DateTime.new(2021,5,3,10,10))).to eq("10:10AM")
    end
    it "parseTimePretty should work when nil" do
      expect(helper.parseTimePretty(nil)).to eq("")
    end
  end

end
