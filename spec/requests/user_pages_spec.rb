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
    end
end
