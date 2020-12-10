class ShoppingCartPage

  include PageObject


  NAME_COLUMN = 1
  SUBTOTAL_COLUMN = 3
  LINES_PER_PUPPY = 6

  button(:proceed_to_checout, :value=>"Complete the Adoption")
  button(:continue_adopt,     :value=>"Adopt Another Puppy")
  table(:cart,                :index=>0)
  cell(:cart_total,           :class=>"total_cell")

  page_url("http://puppies.herokuapp.com/carts/")

  def name_for_line_item(line_item)
    cart_line_item(line_item)[NAME_COLUMN].text
  end

  def subtotal_for_line_item(line_item)
    cart_line_item(line_item)[SUBTOTAL_COLUMN].text
  end

  def cart_total
    cart_total_element.text
  end

  def proceed_to_checkout
    proceed_to_checout
  end

  def continue_adopting
    continue_adopt
  end

  private
  # User define methods for reduce re-usability
  def row_for(line_item)
    return (line_item.to_i - 1)*LINES_PER_PUPPY
  end

  def cart_line_item(line_item)
    cart_element[row_for(line_item)]
  end

end