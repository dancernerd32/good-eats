require 'rails_helper'
require 'pry'

feature 'user adds a restaurant review', %Q{
  As a user
  I want to add a restaurant review
  So that other people know whether or not to try the restaurant
  } do

    # Acceptance Criteria:
    # * A restaurant can have many reviews
    # * Each review must contain a rating between 1 and 5
    # * Each review must contain a body
    # * Each review must contain a timestamp for when it was created
    # * If I do not provide the required information, I receive an error message
    # * Visiting the /restaurants/10/reviews/new should display a form for creating
    #   a new review for a restaurant with ID = 10.

    scenario 'user adds a review' do
      prev_count = Review.count

      restaurant_attrs = {
        name: "Snooze",
        address: "3940 5th Avenue",
        city: "San Diego",
        state: "CA",
        zip: "92103",
        category: "Brunch",
        description: "Best brunch in the world"
      }

      restaurant = Restaurant.create(restaurant_attrs)

      review = Review.new(rating: 5, body: "Described perfectly: best brunch in the world!", restaurant_id: restaurant.id)
      # binding.pry
      visit new_restaurant_review_path(restaurant)


      fill_in 'Rating', with: review.rating
      fill_in 'Body', with: review.body
      click_on 'Submit'

      expect(page).to have_content  "You have successfully added a new review."
      expect(page).to have_content restaurant.name
      expect(page).to have_content review.body
      expect(Review.count).to eq prev_count + 1
    end
  end
