class User < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  has_secure_password

  validates :email, presence: true, uniqueness: true, length: { maximum: 100 }, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: 'does not appear to be valid' }

  paginates_per 1

  def full_name
    "#{firstname} #{lastname}"
  end
end
