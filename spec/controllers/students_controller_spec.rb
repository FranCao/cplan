require 'rails_helper'

describe StudentsController, :type => :controller do
	
	describe 'show' do

		it	"redirect if no graduation_year" do
			ENV["stub_student_id"] = "2"
			@student_info = {id: "2", email: "fake@google.com", last_name: "Fake student", first_name: "fak", track_id: 1}
			Track.stub(:find).with(1).and_return(Track.new({name: "Computer Science"}))
			Student.stub(:find).with("2").and_return(Student.new(@student_info))
			get :show, params:{id:2}
			expect(response).to redirect_to(edit_student_path("2"))
			expect(flash[:notice]).to match(/Please type your graduation year/)
		end
		
		it	"redirect if tack undecided" do
			ENV["stub_student_id"] = "2"
			@undecided_student = {id: 2, email: "fake@google.com", last_name: "Fake student", first_name: "fak", graduation_year: "2020", track_id: 1}
			Student.stub(:find).with("2").and_return(Student.new(@undecided_student))
			@undecided_track = {id: 1, name: "Undecided"}
			Track.stub(:find).with(1).and_return(Track.new(@undecided_track))
			get :show, params:{id:2}
			expect(response).to redirect_to(edit_student_path(2))
			expect(flash[:notice]).to match(/Please select a valid track/)
		end
	end
	
	describe 'create' do
		it "render the flash notice" do
			ENV["stub_student_id"] = "2"
			Student.stub(:find).with("2").and_return(Student.new(@student_info))
			@student_info = {email: "fake@google.com", last_name: "Fake student", first_name: "fak"}
			Student.stub(:create!).with(@student_info).and_return(Student.new(@student_info))
			Student.stub(:find_by_email).with("fake@google.com").and_return(Student.new({id: "2"}))

			post :create, params:{student: @student_info}
			expect(flash[:notice]).to match(/was successfully created/)
		end

		it "redirect" do
			# ENV["stub_student_id"] = "2"
			@student_info = {email: "fake@google.com", last_name: "Fake student", first_name: "fak"}
			Student.stub(:create!).with(@student_info).and_return(Student.new(@student_info))
			Student.stub(:find_by_email).with("fake@google.com").and_return(Student.new({id:'2'}))

			post :create, params:{student: @student_info}
			expect(response).to redirect_to "/students/2"
		end
	end

	describe 'edit' do
		it "render the form" do
			@fake_results = {last_name: "Fake student", first_name: "fak", track_id: 1}
			Student.stub(:find).with("2").and_return(Student.new(@fake_results))
			Track.stub(:find).with(1).and_return(Track.new({id: 1, name: "Computer Bio"}))
			get :edit, params: {id: 2}
			expect(response).to render_template(:edit)
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
			@update_pair = {last_name: "Not fake student", track_id: "1"}
			@fake_result = {id: "3", last_name: "fake student"}
			Student.stub(:find).with("3").and_return(Student.new(@fake_results))
			
			put :update, params: {id:"3", student: @update_pair}
			expect(response.location).to match(/students/)
		end
		it "add courses" do
			@course_info = 	{
				:id => 1,
				:year => "2021",
				:semester => "Summer",
				:call_number => "11494",
				:subject => "COMS",
				:course_number => "4732",
				:course_identifier => "COMSW4732",
				:course_name => "Computer Vision II: Learning"
			}
			@fake_student = {id: "3", last_name: "fake student"}
			Student.stub(:find).with("3").and_return(Student.new(@fake_student))
			Course.stub(:where).with(id: "1").and_return(Course.new(@course_info))
			
			put :update, params: {id:"3", course: {id: "1"}}
			expect(response.location).to match("/students/3/edit")
		end
	end

	describe 'remove_course' do
		it "remove courses" do
			@course_info = 	{
				:id => 1,
				:year => "2021",
				:semester => "Summer",
				:call_number => "11494",
				:subject => "COMS",
				:course_number => "4732",
				:course_identifier => "COMSW4732",
				:course_name => "Computer Vision II: Learning"
			}
			@fake_student = {id: "3", last_name: "fake student"}
			Student.stub(:find).with("3").and_return(Student.new(@fake_student))
			Course.stub(:where).with(id: "1").and_return(Course.new(@course_info))
			
			put :remove_course, params: {id:"3", course_id: "1"}
			expect(response.location).to match("/students/3/edit")
		end
	end

end