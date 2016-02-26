require 'spec_helper'
RSpec.configure do |config|
    config.include Rails.application.routes.url_helpers
	describe "User pages" do
	    subject {page}
	    describe "signup page" do
	    before { visit signup_path }
	    it {should have_content('Sign up')}
	    it {should have_title('Ruby on Rails Tutorial Sample App | Sign up')}
	end

	describe "profile page" do
	    # Replace with code to make a user variable
	    let(:user2) { User.find_by(email: 'i@kvb.su') }
	    let(:user1) {
		User.create(
		    name: 'Viktor',
		    email: 'v@kvb.su',
		    password: 'foobar',
		    password_confirmation: 'foobar'
		)
	    }
	    let(:user) { FactoryGirl.create(:user) }
	    before { visit user_path(user) }
	    it { should have_content(user.name) }
	    it { should have_title(user.name) }
	end

	describe "signup page" do
	    before { visit signup_path }
	    let(:submit) { "Create my account" }

	    describe "with invalid information" do
		it "should not create a user" do
		    expect { click_button submit }.not_to change(User, :count)
		end
	    end

	    describe "with valid information" do
		before do
		    fill_in "Name",         with: "Example User"
		    fill_in "Email",        with: "user@example.com"
		    fill_in "Password",     with: "foobar"
		    fill_in "Confirmation", with: "foobar"
		end

		it "should create a user" do
		    expect { click_button submit }.to change(User, :count).by(1)
		end

		describe "read new user information" do
		    let(:user) { User.find_by(email: 'user@example.com') }
		    before { visit user_path(user) }
		    #it { should have_title(user.name) }
		end

	    end


	end

    end
end
