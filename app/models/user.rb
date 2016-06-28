class User < ActiveRecord::Base
  has_one :cart
  has_many :orders
  has_many :reviews

  validates :email, presence: true
end
