require 'watir'

class HomePage

    def initialize
        @browser ||= Watir::Browser.new :chrome
        @browser.goto "https://www.redfin.com/"
    end

    def sign_in(user, pass)
        @browser.button(:data_rf_test_name => "SignInLink").click
        @browser.button(:data_rf_test_name => "submitButton").click
        @browser.input(:data_rf_test_name => "input", :name => "emailInput").to_subtype.set(user)
        @browser.input(:data_rf_test_name => "input", :name => "passwordInput").to_subtype.set(pass)
        @browser.button(:data_rf_test_name => "submitButton", :class => ["button", "Button", "primary", "submitButton", "v3"]).click
        begin
            if @browser.div(:data_rf_test_name => "Notice", :class => ["Notice", "error"]).wait_until(timeout: 5, &:exists?)
                return "fail"
            end
        rescue Watir::Wait::TimeoutError
            return "successful"
        end
    end

end
