require 'rails_helper'

feature "user views a restaurant's details", %Q{
  As a user
  I want to view the details for a restaurant
  So I can find learn more about it
  } do

    # Acceptance Criteria:
    # * Visiting the /restaurants/10 path should show the restaurant details
    #   for a restaurant with ID = 10.

    scenario "user views a restaurants's details" do
      restaurant1 = Restaurant.create(name: "Snooze1", address: "3940 5th Avenue", city: "San Diego", state: "CA", zip: "92103", category: "Brunch")
      restaurant2 = Restaurant.create(name: "Snooze2", address: "3940 5th Avenue", city: "San Diego", state: "CA", zip: "92103", category: "Brunch")
      restaurant3 = Restaurant.create(name: "Snooze3", address: "3940 5th Avenue", city: "San Diego", state: "CA", zip: "92103", category: "Brunch")
      restaurant4 = Restaurant.create(name: "Snooze4", address: "3940 5th Avenue", city: "San Diego", state: "CA", zip: "92103", category: "Brunch")
      restaurant5 = Restaurant.create(name: "Snooze5", address: "3940 5th Avenue", city: "San Diego", state: "CA", zip: "92103", category: "Brunch")
      restaurant6 = Restaurant.create(name: "Snooze6", address: "3940 5th Avenue", city: "San Diego", state: "CA", zip: "92103", category: "Brunch")
      restaurant7 = Restaurant.create(name: "Snooze7", address: "3940 5th Avenue", city: "San Diego", state: "CA", zip: "92103", category: "Brunch")
      restaurant8 = Restaurant.create(name: "Snooze8", address: "3940 5th Avenue", city: "San Diego", state: "CA", zip: "92103", category: "Brunch")
      restaurant9 = Restaurant.create(name: "Snooze9", address: "3940 5th Avenue", city: "San Diego", state: "CA", zip: "92103", category: "Brunch")
      restaurant10 = Restaurant.create(name: "Snooze10", address: "3940 5th Avenue", city: "San Diego", state: "CA", zip: "92103", category: "Brunch", description: "Best brunch in the world")








      visit restaurant_path(restaurant10)


      expect(page).to have_content restaurant10.name
      expect(page).to have_content restaurant10.address
      expect(page).to have_content restaurant10.city
      expect(page).to have_content restaurant10.state
      expect(page).to have_content restaurant10.zip
      expect(page).to have_content restaurant10.category
      expect(page).to have_content restaurant10.description
    end
  end
