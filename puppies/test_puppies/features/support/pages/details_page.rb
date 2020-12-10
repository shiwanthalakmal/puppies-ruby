class DetailsPage

  include PageObject

  button(:add_to_cart, :value => "Adopt Me!")

  page_url("http://puppies.herokuapp.com/puppies/")


  def adopt_me
    add_to_cart
  end
end