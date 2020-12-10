require 'watir-webdriver'



Before do
  @browser = Watir::Browser.new :firefox
  @browser.cookies.clear
end


After do
  @browser.close
end