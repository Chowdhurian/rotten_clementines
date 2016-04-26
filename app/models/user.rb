class User < ActiveRecord::Base
  has_many :reviews

  has_secure_password

  validates :email, presence: true

  def full_name
    "#{firstname} #{lastname}"
  end
end
