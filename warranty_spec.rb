require 'rspec'
require 'capybara/rspec'
require  'eyes_selenium'
require 'applitools/capybara'
require 'pry'
require 'pry-byebug'
Selenium::WebDriver::Chrome.driver_path = "C:/Users/Prachi/Downloads/chromedriver_win32/chromedriver.exe"

Applitools.register_capybara_driver :browser => :chrome

describe ' Warranty tickets ', :type => :feature, :js => true do
  it "Login" do
    visit 'http://admin.vueops-qa.com/admin/clients'
    fill_in "auth_key", with: 'prachi.sharma@instantsys.com'
    fill_in "password", with: 'Vueops@22'
    click_button 'Login'
    binding.pry
    click_button 'Continue' 
    sleep 2.0
    fill_in 'Search Client', with: 'prachi'
    sleep 0.2
    find(".fa.fa-search").click
    sleep 1.0

    click_on "Prachi sample's"
    sleep 0.5
    click_on 'bitwise'

    click_on "Add"
    find(".form-group.col-lg-12.col-md-12.col-sm-12").click
    fill_in "title", with: 'Issue with tiles'
    select "verify", from: "Project"
    select "Normal", from: "priority"
    fill_in "location", with: 'Delhi'
    fill_in "description", with: 'New ticket'
    select "FINISH FLOOR",from: "location_name"
    sleep 0.5
    select "COPY 222",from: "room"
    find('.form-group.col-lg-2.col-md-4.col-sm-4.col-xs-12').click
    select "00 - Procurement and Contracting Requirements", from: "division_0"
    sleep 0.8
    select "001000 - Solicitation", from: "section_0"
    click_on "Create Warranty Ticket"
    
    sleep 10

    expect(page).to have_content 'Issue with tiles'
    expect(page).to have_content 'verify'
    expect(page).to have_content 'Normal'
    expect(page).to have_content 'Delhi'
    sleep 10
    expect(page).to have_content 'New ticket' 
    expect(page).to have_content 'FINISH FLOOR'
    expect(page).to have_content '00 - Procurement and Contracting Requirements'
    expect(page).to have_content '001000 - Solicitation'

    find(".service-request__section.section_info").click
    page.accept_alert

end
end