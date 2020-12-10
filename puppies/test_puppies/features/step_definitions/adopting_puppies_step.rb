Given(/^I am on the puppy adoption site$/) do
  visit_page(HomePage)
end

And(/^I click the Adopt Me button$/) do
  on_page(DetailsPage).adopt_me
end

And(/^I click the Complete the Adoption button$/) do
  on_page(ShoppingCartPage).proceed_to_checkout
end

And(/^I enter "([^"]*)" in name field$/) do |name|
  on_page(CheckoutPage).name = name
end

And(/^I enter "([^"]*)" in the address field$/) do |address|
  on_page(CheckoutPage).address = address
end

And(/^I enter "([^"]*)" in the email field$/) do |mail|
  on_page(CheckoutPage).email = mail
end

And(/^I select "([^"]*)" from the pay with dropdown$/) do |type|
  on_page(CheckoutPage).pay_type = type
end

And(/^I click the Place Order button$/) do
  on_page(CheckoutPage).submit
end

Then(/^I should see "([^"]*)"$/) do |msg|
  @current_page.text.should include msg
end

And(/^I click the Adopt Another Puppy button$/) do
  on_page(ShoppingCartPage).continue_adopting
end

And(/^I click the second view details button$/) do
  on_page(HomePage).choose_puppy_view(2)
end

Then(/^I should see "([^"]*)" as the name for line item (\d+)$/) do |name,line_item|
  on_page(ShoppingCartPage).name_for_line_item(line_item).should include name
end

And(/^I should see "([^"]*)" as the subtotal for line item (\d+)$/) do |sub,line_item|
  on_page(ShoppingCartPage).subtotal_for_line_item(line_item).should == sub
end


And(/^I should see "([^"]*)" as the cart total$/) do |tot|
  on_page(ShoppingCartPage).cart_total.should == tot
end


When(/^I click the view details button for "([^"]*)"$/) do |name|
  on_page(HomePage).choose_puppy_view(name)
end

And(/^I complete the adoption with:$/) do |table|
  # table is a table.hashes.keys # => [:name, :address, :email, :pay_type]
  on_page(CheckoutPage).checkout(table.hashes.first)
end

When(/^I complete the adoption of a puppy$/) do
=begin
  on_page(HomePage).choose_puppy_view
  on_page(DetailsPage).adopt_me
  on_page(ShoppingCartPage).proceed_to_checkout
  on_page(CheckoutPage).checkout()
=end
  navigate_to(CheckoutPage).checkout()
end

And(/^I complete the adoption using a Credit card$/) do
  on_page(CheckoutPage).checkout('pay_type' => 'Credit card')
end

And(/^I complete the adoption$/) do
  on_page(CheckoutPage).checkout()
end

When(/^I checkout leaving the name field blank$/) do
=begin
  on_page(HomePage).choose_puppy_view
  on_page(DetailsPage).adopt_me
  on_page(ShoppingCartPage).proceed_to_checkout
  on_page(CheckoutPage).checkout('name' => '')
=end
  navigate_to(CheckoutPage).checkout('name' => '')
end

Then(/^I should see the error message "([^"]*)"$/) do |msg|
  #@current_page.error_message.should include msg
  @current_page.should have_error_message msg

end

Given(/^I have a pending adoption for "([^"]*)"$/) do |name|
=begin
  on_page(HomePage).choose_puppy_view
  on_page(DetailsPage).adopt_me
  on_page(ShoppingCartPage).proceed_to_checkout
  on_page(CheckoutPage).checkout('name' => name)
=end
  navigate_to(CheckoutPage).checkout('name' => name)
end

When(/^I process that adoption$/) do
  visit_page(LandingPage)
=begin
  on_page(LoginPage).login_to_system
  on_page(LandingPage).adoptions
  on_page(ProcessPuppyPage).process_first_puppy
=end
  navigate_to(ProcessPuppyPage, :using => :process_rout).process_first_puppy
end