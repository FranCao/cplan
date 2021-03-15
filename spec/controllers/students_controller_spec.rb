require 'rails_helper'

describe StudentsController, :type => :controller do

	# describe 'show' do
	# 	it	"redirect if no graduation_year" do
	# 		@student_info = {id: "2", email: "fake@google.com", last_name: "Fake student", first_name: "fak"}
	# 		Student.stub(:find).with("2").and_return(@student_info)

	# 		get :show, params:{id:2}
	# 		expect(response).to redirect_to(edit_student_path(@student))
	# 	end
	# end
	
	describe 'create' do
		it "render the flash notice" do
			@student_info = {email: "fake@google.com", last_name: "Fake student", first_name: "fak"}
			Student.stub(:create!).with(@student_info).and_return(Student.new(@student_info))
			Student.stub(:find_by_email).with("fake@google.com").and_return(Student.new({id:'12'}))

			post :create, params:{student: @student_info}
			expect(flash[:notice]).to match(/was successfully created/)
		end

		it "redirect" do
			@student_info = {email: "fake@google.com", last_name: "Fake student", first_name: "fak"}
			Student.stub(:create!).with(@student_info).and_return(Student.new(@student_info))
			Student.stub(:find_by_email).with("fake@google.com").and_return(Student.new({id:'12'}))

			post :create, params:{student: @student_info}
			expect(response).to redirect_to "/students/12"
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
		it "render the flash notice" do
			@update_pair = {last_name: "Not fake student"}
			@fake_result = {id: "1", last_name: "fake student"}
			Student.stub(:find).with("1").and_return(Student.new(@fake_results))
			
			put :update, params: {id:"1", student: @update_pair}
			expect(flash[:notice]).to match(/was successfully updated/)
		end
		it "redirect after update" do
			@update_pair = {last_name: "Not fake student"}
			@fake_result = {id: "3", last_name: "fake student"}
			Student.stub(:find).with("3").and_return(Student.new(@fake_results))
			
			put :update, params: {id:"3", student: @update_pair}
			expect(response.location).to match(/students/)
		end
	end

end