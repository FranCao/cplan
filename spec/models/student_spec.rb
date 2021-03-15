require 'rails_helper'

RSpec.describe Student, type: :model do
  describe "from_omniauth" do
  	it "update student record" do
  		@fake_result = {email: "fake@gmail.com", first_name: "fake", last_name: "fake"}
		Student.stub(:where).with(:email => "fake@gmail.com").and_return(Student)

		Info = Struct.new(:first_name, :last_name, :email)
		info = Info.new("padoo", "dodaa","fake@gmail.com")
		Auth = Struct.new(:info)
		auth = Auth.new(info)

		expect(Student.from_omniauth(auth).to_json).to eq(Student.new({first_name: "padoo", last_name: "dodaa", email: "fake@gmail.com"}).to_json)
  	end
  end
end