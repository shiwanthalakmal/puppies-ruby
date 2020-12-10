require_relative 'side_menu_panel'

class HomePage

  include PageObject
  include SideMenuPanel

  button(:first_view, :value=>"View Details", :index=>0)
  button(:second_view, :value=>"View Details", :index=>1)

  page_url("http://puppies.herokuapp.com/")

  PUPPY_LOOKUP = {
      'Brook' => 0,
      'Hanna' => 1
  }

  def choose_puppy_view(name = 'Brook')
    index = puppy_index_for(name)
    button_element(:value=>"View Details",:index=> index).click
  end

  def puppy_index_for(name)
    PUPPY_LOOKUP[name]
  end
end