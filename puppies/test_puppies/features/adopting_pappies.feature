Feature: Adopting Puppies
  As a puppy lover
  I want to adopt puppies
  So they can chew my furniture

  Background:
    Given I am on the puppy adoption site

  @basic0
  Scenario: Adopting one puppy
    When I click the view details button for "Brook"
    And I click the Adopt Me button
    And I click the Complete the Adoption button
    And I enter "Cheezy" in name field
    And I enter "123 Main Street" in the address field
    And I enter "cheezy@gail.com" in the email field
    And I select "Credit card" from the pay with dropdown
    And I click the Place Order button
    Then I should see "Thank you for adopting a puppy!"

  @basic0
  Scenario Outline: Adopting two puppies
    When I click the view details button for "Brook"
    And I click the Adopt Me button
    And I click the Adopt Another Puppy button
    And I click the second view details button
    And I click the Adopt Me button
    And I click the Complete the Adoption button
    And I enter "<name>" in name field
    And I enter "<address>" in the address field
    And I enter "<email>" in the email field
    And I select "<pay_type>" from the pay with dropdown
    And I click the Place Order button
    Then I should see "Thank you for adopting a puppy!"

    Examples:
    |name |address        |email          |pay_type   |
    |Saman|141 Main Street|saman@gmail.com|Credit card|
    |Nimal|152 Main Street|nimal@gmail.com|Credit card|
    |Pasan|342 Main Street|pasan@gmail.com|Credit card|

  @basic0
  Scenario: Validate cart with one puppy
    When I click the view details button for "Brook"
    And I click the Adopt Me button
    Then I should see "Brook" as the name for line item 1
    Then I should see "$34.95" as the subtotal for line item 1
    And I should see "$34.95" as the cart total

  @basic0
  Scenario: Validate cart with two puppy
    When I click the view details button for "Brook"
    And I click the Adopt Me button
    And I click the Adopt Another Puppy button
    And I click the view details button for "Hanna"
    And I click the Adopt Me button
    Then I should see "Brook" as the name for line item 1
    And I should see "$34.95" as the subtotal for line item 1
    And I should see "Hanna" as the name for line item 2
    And I should see "$22.99" as the subtotal for line item 2
    And I should see "$57.94" as the cart total

  @basic
  Scenario: Adopting a puppy using a table
     When I click the view details button for "Brook"
     And I click the Adopt Me button
     And I click the Complete the Adoption button
     And I complete the adoption with:
     |name  |address        |email          |pay_type   |
     |Saman |232 Main Street|saman@gmail.com|Check      |
     Then I should see "Thank you for adopting a puppy!"

  @basic0
  Scenario: Thank you message should be displayed
#    When I click the view details button for "Brook"
#    And I click the Adopt Me button
#    And I click the Complete the Adoption button
    And I complete the adoption of a puppy
    Then I should see "Thank you for adopting a puppy!"

  @basic0
  Scenario: Adopting a puppy using partial default data
    When I click the view details button for "Brook"
    And I click the Adopt Me button
    And I click the Complete the Adoption button
    And I complete the adoption using a Credit card
    Then I should see "Thank you for adopting a puppy!"

  @basic0
  Scenario: Adopting a puppy using all default data
    When I click the view details button for "Brook"
    And I click the Adopt Me button
    And I click the Complete the Adoption button
    And I complete the adoption
    Then I should see "Thank you for adopting a puppy!"


  @basic0
  Scenario: Name is required field
    When I checkout leaving the name field blank
    Then I should see the error message "Name can't be blank"

  @basic0
  Scenario: Verify message when adoption is precessed
    Given I have a pending adoption for "Cheezy"
    When I process that adoption
    Then I should see "Please thank Cheezy for the order!"

