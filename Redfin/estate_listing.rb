class Estate_Page

    def initialize
        @browser ||= Watir::Browser.new :chrome
        @browser.goto "https://www.redfin.com/"
    end

    def enter_search(city)
        @browser.input(:data_rf_test_name => "search-box-input", :name => "searchInputBox").to_subtype.set(city)
        @browser.button(:data_rf_test_name => "searchButton", :title => "Search").click
    end

    def max_price(price)
        @browser.span(:data_rf_test_name => "Select", :class ["quickMaxPrice", "withFlyout", "withOptions", "mounted", "field", "select", "Select", "clickable"]).click
        @browser.div(:class => ["Flyout", "standard", "v83", "position-below", "alignment-left", "no-padding", "no-adjustment", "none", "transparent", "standard"]).div(:class => "option", :text => price).when_present.click
    end

    def open_filters
        @browser.button(:data_rf_test_id => "filterButton").click
    end

    def max_beds(beds)
        @browser.span(:data_rf_test_name => "Select", :class => ["maxBeds", "withFlyout", "withOptions", "mounted", "field", "select", "Select", "clickable"]).click
        @browser.div(:class => ["Flyout", "standard", "v83", "position-below", "alignment-left", "no-padding", "no-adjustment", "none", "transparent", "standard"]).div(:class => "option", :text => beds).when_present.click
    end

    def num_baths(baths)
        @browser.span(:data_rf_test_name => "Stepper", :class => ["withFlyout", "withOptions", "field", "select", "Stepper", "Select", "clickable", "baths"]).click
        @browser.div(:class => ["Flyout", "standard", "v83", "position-below", "alignment-left", "no-padding", "no-adjustment", "none", "transparent", "standard"]).div(:class => "option", :text => baths + "+").when_present.click
    end
