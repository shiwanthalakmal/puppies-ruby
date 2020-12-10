require_relative 'error_panel'

class CheckoutPage

  include PageObject
  include ErrorPanel

  text_field(:name, :id=>"order_name")
  text_field(:address, :id=>"order_address")
  text_field(:email, :id=>"order_email")
  select_list(:pay_type, :id=>"order_pay_type")
  button(:submit, :value=>"Place Order")

  page_url("http://puppies.herokuapp.com/orders/new")

=begin
  DEFAULT_DATA = {
      'name' => 'cheezy',
      'address' => '141 Pitipana',
      'email' => 'cheezy@gmail.com',
      'pay_type' => 'Check'
  }
=end

  DEFAULT_DATA = {
      'name' => Faker::Name.name,
      'address' => Faker::Address.street_address,
      'email' => Faker::Internet.email,
      'pay_type' => 'Check'
  }


  def checkout(data = {})
=begin
    data = DEFAULT_DATA.merge(data)
    self.name = data['name']
    self.address = data['address']
    self.email = data['email']
    self.pay_type = data['pay_type']
    submit
=end

    populate_page_with DEFAULT_DATA.merge(data)

=begin
    populate_page_with data_for(:checkout_page, data)
=end
    submit
  end


end