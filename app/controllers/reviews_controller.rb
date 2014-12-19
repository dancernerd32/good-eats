
class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.build
  end
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.build(review_params)
    if @review.save
      flash[:notice] = "You have successfully added a new review."
      redirect_to restaurant_path(@restaurant)
    else
      render new_restaurant_review_path(@restaurant)
    end
  end

  private
  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
