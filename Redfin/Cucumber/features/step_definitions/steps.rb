require_relative "../../../estate_listing"

# Capybara + Cucumber ###################################################
Given("{string} and {string}") do |username, password|
    @username = username; @password = password
end

When("I login to Redfin with Google Chrome") do
    visit 'https://www.redfin.com'
    click_button("Log In")
    click_button("Continue with Email")
    fill_in('Email', :with => @username)
    fill_in('Password', :with => @password)
    click_button("Sign In")
    if page.has_content?("Error")
        @my_login_status = 'fail'
    else
        @my_login_status = 'successful'
    end
end

Then("I should be {string}") do |result|
    expect(@my_login_status).to eq(result)
end
#########################################################################

# Cucumber + Watir + Page objects #######################################
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
    @my_search_status ||= @estatepage.check_results
end

Then("I should be {string} and only see results based on my criteria") do |results|
    expect(@my_search_status).to eq(results)
end
#########################################################################
