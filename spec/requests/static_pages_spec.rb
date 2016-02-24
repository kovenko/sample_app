RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
    describe "Static pages" do

	subject {page}

	shared_examples_for "all static pages" do
	    it {should have_selector('h1', text: heading)}
	    it {should have_title('Ruby on Rails Tutorial Sample App' + page_title)}
	end

	describe "Home page" do
#	    before {visit root_path}
#	    it {should have_content('Sample App')}
#	    it {should have_title("Ruby on Rails Tutorial Sample App")}
#	    it {should_not have_title('| Home')}
	    before {visit root_path}
	    let(:heading)    { 'Sample App' }
	    let(:page_title) { '' }
	    it_should_behave_like "all static pages"
	    it { should_not have_title('| Home') }
	end

	describe "Help page" do
	    before {visit help_path}
	    let(:heading)    { 'Help' }
	    let(:page_title) { ' | Help' }
	    it_should_behave_like "all static pages"
	end

	describe "About page" do
	    before {visit about_path}
	    let(:heading)    { 'About' }
	    let(:page_title) { ' | About Us' }
	    it_should_behave_like "all static pages"
	end

	describe "Contact page" do
	    before {visit contact_path}
	    let(:heading)    { 'Contact' }
	    let(:page_title) { ' | Contact' }
	    it_should_behave_like "all static pages"
	end

	it "should have the right links on the layout" do
	    visit root_path

	    click_link "About"
	    expect(page).to have_title('Ruby on Rails Tutorial Sample App | About Us')

	    click_link "Help"
	    expect(page).to have_title('Ruby on Rails Tutorial Sample App | Help')

	    click_link "Contact"
	    expect(page).to have_title('Ruby on Rails Tutorial Sample App | Contact')

	    click_link "Home"
	    expect(page).to have_title('Ruby on Rails Tutorial Sample App')

	    click_link "Sign up now!"
	    expect(page).to have_title('Ruby on Rails Tutorial Sample App | Sign up')

	    click_link "sample app"
	    expect(page).to have_title('Ruby on Rails Tutorial Sample App')
	end


    end
end
