class ReviewsController < ApplicationController

  before_filter :load_material
  before_filter :restrict_access

  def new
    @review = @material.reviews.build
  end

  def create
    @review = @material.reviews.build(review_params)
    @review.user_id = current_user.id

    if @review.save
      redirect_to @material, notice: "Review submitted successfully"
    else
      render :new
    end
  end

  protected

  def load_material
    @material = Material.find(params[:material_id])
  end

  def review_params
    params.require(:review).permit(:text, :rating_out_of_ten)
  end
end
