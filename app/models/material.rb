class Material < ActiveRecord::Base
  has_many :reviews

  mount_uploader :poster_image, PosterImageUploader
  validates_processing_of :poster_image
  validates :title, presence: true
  validates :director, presence: true
  validates :runtime_in_minutes, numericality: { only_integer: true }
  validates :description, presence: true
  validates :release_date, presence: true
  validate :poster_image_size_validation

  def review_average
    reviews.sum(:rating_out_of_ten)/reviews.size unless reviews.size == 0
  end

  def self.search(search_params)
    Material.where("title LIKE ? OR director LIKE ?", "%#{search_params}%", "%#{search_params}%")
  end

  protected

  # unused
  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end

  private

  def poster_image_size_validation
    errors[:poster_image] << "should be less than 500KB" if poster_image.size > 0.5.megabytes
  end

end
