class User < ActiveRecord::Base
  has_many :reviews

  has_secure_password

  validates :email, presence: true

end
