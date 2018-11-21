require "watir"
require_relative "../../../home_page"

Given("{string} and {string}") do |username, password|
  @username = username; @password = password # Write code here that turns the phrase above into concrete actions
end

When("I login to Redfin with Google Chrome") do
  @browser = HomePage.new
  @my_login_status = @browser.sign_in(@username, @password)
  puts @my_login_status
   # Write code here that turns the phrase above into concrete actions
end

Then("I should be {string}") do |result|
  expect(@my_login_status).to eq(result)
  # Write code here that turns the phrase above into concrete actions
end
