require 'watir'

class EstatePage

    def initialize
        @browser ||= Watir::Browser.new :chrome
        @browser.goto "https://www.redfin.com/"
    end

    def enter_search(city)
        @browser.input(:data_rf_test_name => "search-box-input", :name => "searchInputBox").to_subtype.set(city)
        @browser.button(:data_rf_test_name => "searchButton", :title => "Search").click
        Watir::Wait.until {@browser.text.include?(city)}
        return @browser.title
    end

    def max_price()
        @browser.span(:data_rf_test_name => "Select", :class => ["quickMaxPrice", "withFlyout", "withOptions", "mounted", "field", "select", "Select", "clickable"]).click
        @browser.div(:class => ["Flyout", "standard", "v83", "position-below", "alignment-left", "no-padding", "no-adjustment", "none", "transparent", "standard"]).div(:class => "option", :text => "$1M").when_present.click
    end

    def open_filters
        @browser.button(:data_rf_test_id => "filterButton").click
    end

    def max_beds(beds)
        @beds = beds
        @browser.span(:data_rf_test_name => "Select", :class => ["maxBeds", "withFlyout", "withOptions", "mounted", "field", "select", "Select", "clickable"]).click
        @browser.div(:class => ["Flyout", "standard", "v83", "position-below", "alignment-left", "no-padding", "no-adjustment", "none", "transparent", "standard"]).div(:class => "option", :text => beds.to_s).when_present.click
    end

    def num_baths(baths)
        @baths = baths
        @browser.span(:data_rf_test_name => "Stepper", :class => ["withFlyout", "withOptions", "field", "select", "Stepper", "Select", "clickable", "baths"]).click
        @browser.div(:class => ["Flyout", "standard", "v83", "position-below", "alignment-left", "no-padding", "no-adjustment", "none", "transparent", "standard"]).div(:class => "option", :text => baths.to_s + "+").when_present.click
    end

    def apply_filters
        @browser.button(:data_rf_test_id => "apply-search-options").click
    end

    def check_results
        @browser.button(:data_rf_test_name => "mode-option", :class => "ModeOption button-text").click
        table_results = @browser.tbody(:class => "tableList").wait_until(&:present?)
        if ! table_results.rows.any? {|i| i[4].text.to_f > @beds.to_f || i[5].text.to_f < @baths.to_f || i[3].text.tr("$,", '').to_i > 1000000}
            return "successful"
        else
            return "fail"
        end
    end

end
