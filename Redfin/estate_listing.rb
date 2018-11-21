class Estate_Page

    def initialize
        @browser ||= Watir::Browser.new :chrome
        @browser.goto "https://www.redfin.com/"
    end

    def enter_search(city)
        @browser.input(:data_rf_test_name => "search-box-input", :name => "searchInputBox").to_subtype.set(city)
        @browser.button(:data_rf_test_name => "searchButton", :title => "Search").click
    end

    def change_max(price)
    end
