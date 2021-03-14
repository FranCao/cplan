require 'rails_helper'

describe StudentsController, :type => :controller do

	describe 'create' do
		it "render the flash" do
			@student_info = {email: "fake@google.com", last_name: "Fake student", first_name: "fak"}
			Student.stub(:create!).with(@student_info).and_return(Student.new(@student_info))
			Student.stub(:find_by_email).with("fake@google.com").and_return(Student.new({id:'12'}))

			post :create, params:{student: @student_info}
			expect(flash[:notice]).to match(/was successfully/)
		end
	end

	describe 'edit' do
		it "render the form" do
			@fake_results = {last_name: "Fake student", first_name: "fak"}
			Student.stub(:find).with("1").and_return(@fake_results)
			get :edit, params: {id: 1}
			expect(response).to render_template("edit")
		end
	end

	describe 'update' do
		it "Student.title to new title" do
			@update_pair = {title: "Not fake student"}
			@fake_result = {id: "1", title: "fake student", rating: "G", description: "fake description", release_date: "5-Nov-2004"}
			Student.stub(:find).with("1").and_return(Student.new(@fake_results))
			
			put :update, id:"1", student: @update_pair
			expect(Student.find("1").title).to eq("Not fake student")
		end
		# it "redirect after update" do
		# 	@update_pair = {title: "Not fake student"}
		# 	@fake_result = {id: "1", title: "fake student", rating: "G", description: "fake description", release_date: "5-Nov-2004"}
		# 	Student.stub(:find).with("1").and_return(Student.new(@fake_results))
			
		# 	post :update, id:"1", student: @update_pair
		# 	expect(response).to redirect_to(student_path(@update_pair))

		# end
	end

end