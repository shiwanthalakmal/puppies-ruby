require 'rspec'
require 'page-object'
require 'page-object/page_factory'
require 'faker'
require 'data_magic'
require 'require_all'

require_all File.dirname(__FILE__) + '/pages'

World(PageObject::PageFactory)

PageObject::PageFactory.routes = {
    :default => [[HomePage, :choose_puppy_view],[DetailsPage, :adopt_me],[ShoppingCartPage, :proceed_to_checkout],[CheckoutPage, :checkout]],
    :process_rout => [[LoginPage, :login_to_system],[LandingPage, :adoptions],[ProcessPuppyPage, :process_first_puppy]],
}