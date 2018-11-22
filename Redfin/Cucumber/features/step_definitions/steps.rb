require "watir"
require_relative "../../../home_page"
require_relative "../../../estate_listing"

Given("{string} and {string}") do |username, password|
    @username = username; @password = password # Write code here that turns the phrase above into concrete actions
end

When("I login to Redfin with Google Chrome") do
    @homepage = HomePage.new
    @my_login_status = @homepage.sign_in(@username, @password)
    puts @my_login_status
   # Write code here that turns the phrase above into concrete actions
end

Then("I should be {string}") do |result|
    expect(@my_login_status).to eq(result)
  # Write code here that turns the phrase above into concrete actions
end

Given("I want {int} beds and {int} and at the max price of '$1M' in {string}") do |beds, baths, city|
    @estatepage = EstatePage.new
    current_page = @estatepage.enter_search(city)
    if current_page.include? city
        @estatepage.max_price
        @estatepage.open_filters
        @estatepage.max_beds(beds)
        @estatepage.num_baths(baths)
        @estatepage.apply_filters
    else
        @my_search_status ||= 'fail'
    end
end

When("I search for listings on Redfin with my criteria") do
    @my_search_status ||= @estatepage.check_results # Write code here that turns the phrase above into concrete actions
end

Then("I should be {string} and only see results based on my criteria") do |results|
    expect(@my_search_status).to eq(results) # Write code here that turns the phrase above into concrete actions
end
