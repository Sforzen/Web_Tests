require "watir"
require "rspec"

describe "google.com" do
  let(:browser) { @browser ||= Watir::Browser.new :chrome }
  before { browser.goto "http://google.com" }
  browser.text_field(name: "q").set "watir"
  browser.button.click
  browser.div(id: "resultStats").wait_until_present
  browser.title.should == "watir - Google Search"
end
