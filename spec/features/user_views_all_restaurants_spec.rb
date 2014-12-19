require 'rails_helper'

feature "User visits the restaurants page" do
  # As a User
  # I want to see all the restaurants on one page
  # So that I know can choose a restaurant to look at
  #
  # Acceptance Criteria:
  #
  # * I see a title that lets me know I'm on the right page
  # * I see all of the restaurants listed

  it "sees a restaurant" do
    restaurant1 = Restaurant.create(name: "Snooze", address: "3940 5th Avenue", city: "San Diego", state: "CA", zip: "92103", description: "Brunch")
    restaurant2 = Restaurant.create(name: "FABB", address: "3925 4th Ave", city: "San Diego", state: "CA", zip: "92103", description: "Asian Fusion")

    visit '/restaurants'

    expect(page).to have_content "Restaurants"
    expect(page).to have_content restaurant1.name
    expect(page).to have_content restaurant2.name

  end
end
