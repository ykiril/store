class OrderBook < ActiveRecord::Base
  belongs_to :book
  belongs_to :order

  validates :price, :quantity, presence: true

  after_destroy :update_totals
  delegate :update_totals, to: :order
end
