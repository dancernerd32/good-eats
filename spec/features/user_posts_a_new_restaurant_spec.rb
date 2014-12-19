require 'rails_helper'
require 'pry'

feature "User posts a new restaurant" do
  # As a user
  # I want to post a restaurant
  # So that it can be reviewed
  #
  # Acceptance Criteria
  #
  # - I must provide a restaurant name
  # - I must provide an address
  # - - I must provide a city
  # - I must provide a valid state abbreviation
  # - I must provide an valid zip
  # - I may optionally provide a description
  # - I may optionally provide a category
  # - I must be presented with errors if I fill out the form incorrectly

  scenario "posts a valid entry" do
    prev_count = Restaurant.count
    restaurant = Restaurant.new(name: "Snooze", address: "3940 5th Avenue", city: "San Diego", state: "CA", zip: "92103", category: "Brunch")
    # Visit the page containing the new restaurant form

    visit '/restaurants/new'

    # Fill in the input field with the 'Location' label
    fill_in "Name", with: restaurant.name
    fill_in "Address", with: restaurant.address
    fill_in "City", with: restaurant.city
    fill_in "State", with: restaurant.state
    fill_in "Zip", with: restaurant.zip
    fill_in "Category", with: restaurant.category
    click_on "Add Restaurant"

    expect(Restaurant.count).to eq prev_count + 1
    expect(page).to have_content "You have successfully added a new restaurant."
    expect(page).to have_content restaurant.name

  end

  scenario "posts an invalid entry -- doesn't provide a name" do
    prev_count = Restaurant.count
    restaurant = Restaurant.new(name: "Snooze", address: "3940 5th Avenue", city: "San Diego", state: "CA", zip: "92103", category: "Brunch", description: "Best brunch in the world")
    visit new_restaurant_path
    fill_in "Description", with: restaurant.description
    fill_in "Address", with: restaurant.address
    fill_in "City", with: restaurant.city
    fill_in "State", with: restaurant.state
    fill_in "Zip", with: restaurant.zip
    fill_in "Category", with: restaurant.category
    click_on 'Add Restaurant'

    expect(page).to_not have_content "You have successfully added a new restaurant."
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Your restaurant couldn't be saved."
    expect(Restaurant.count).to eq prev_count
  end

  scenario "posts an invalid entry -- doesn't provide an address" do
    prev_count = Restaurant.count
    restaurant = Restaurant.new(name: "Snooze", address: "3940 5th Avenue", city: "San Diego", state: "CA", zip: "92103", category: "Brunch", description: "Best brunch in the world")
    visit new_restaurant_path
    fill_in "Name", with: restaurant.name
    fill_in "Description", with: restaurant.description
    fill_in "City", with: restaurant.city
    fill_in "State", with: restaurant.state
    fill_in "Zip", with: restaurant.zip
    fill_in "Category", with: restaurant.category
    click_on 'Add Restaurant'

    expect(page).to_not have_content "You have successfully added a new restaurant."
    expect(page).to have_content "Address can't be blank"
    expect(page).to have_content "Your restaurant couldn't be saved."
    expect(Restaurant.count).to eq prev_count
  end

  scenario "posts an invalid entry -- doesn't provide a city" do
    prev_count = Restaurant.count
    restaurant = Restaurant.new(name: "Snooze", address: "3940 5th Avenue", city: "San Diego", state: "CA", zip: "92103", category: "Brunch", description: "Best brunch in the world")
    visit new_restaurant_path
    fill_in "Name", with: restaurant.name
    fill_in "Address", with: restaurant.address
    fill_in "Description", with: restaurant.description
    fill_in "State", with: restaurant.state
    fill_in "Zip", with: restaurant.zip
    fill_in "Category", with: restaurant.category
    click_on 'Add Restaurant'

    expect(page).to_not have_content "You have successfully added a new restaurant."
    expect(page).to have_content "City can't be blank"
    expect(page).to have_content "Your restaurant couldn't be saved."
    expect(Restaurant.count).to eq prev_count
  end
  scenario "posts an invalid entry -- doesn't provide a state" do
    prev_count = Restaurant.count
    restaurant = Restaurant.new(name: "Snooze", address: "3940 5th Avenue", city: "San Diego", state: "CA", zip: "92103", category: "Brunch", description: "Best brunch in the world")
    visit new_restaurant_path
    fill_in "Name", with: restaurant.name
    fill_in "Address", with: restaurant.address
    fill_in "Description", with: restaurant.description
    fill_in "City", with: restaurant.city
    fill_in "Zip", with: restaurant.zip
    fill_in "Category", with: restaurant.category
    click_on 'Add Restaurant'

    expect(page).to_not have_content "You have successfully added a new restaurant."
    expect(page).to have_content "State can't be blank"
    expect(page).to have_content "Your restaurant couldn't be saved."
    expect(Restaurant.count).to eq prev_count
  end

  scenario "posts an invalid entry -- doesn't provide a zip" do
    prev_count = Restaurant.count
    restaurant = Restaurant.new(name: "Snooze", address: "3940 5th Avenue", city: "San Diego", state: "CA", zip: "92103", category: "Brunch", description: "Best brunch in the world")
    visit new_restaurant_path
    fill_in "Name", with: restaurant.name
    fill_in "Address", with: restaurant.address
    fill_in "Description", with: restaurant.description
    fill_in "City", with: restaurant.city
    fill_in "State", with: restaurant.state
    fill_in "Category", with: restaurant.category
    click_on 'Add Restaurant'

    expect(page).to_not have_content "You have successfully added a new restaurant."
    expect(page).to have_content "Zip can't be blank"
    expect(page).to have_content "Your restaurant couldn't be saved."
    expect(Restaurant.count).to eq prev_count
  end

end
