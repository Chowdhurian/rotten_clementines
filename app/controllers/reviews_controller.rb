class ReviewsController < ApplicationController
  def new
    @material = Material.find(params[:material_id])
    @review = @material.reviews.build
  end

  def create
    @material = Material.find(params[:material_id])
    @review = @material.reviews.build(review_params)
    @review.user_id = current_user.id

    if @review.save
      redirect_to @material, notice: "Review submitted successfully"
    else
      render :new
    end
  end

  protected

  def review_params
    params.require(:review).permit(:text, :rating_out_of_ten)
  end
end
