class Book < ActiveRecord::Base
  belongs_to :author
  belongs_to :category
  has_many :reviews
  has_many :order_books
  
  mount_uploader :image, ImageUploader  

  def self.best_books
    joins(:order_books)
      .select('books.*, sum(order_books.quantity) as qty')
      .group(:id)
      .order('qty DESC')
  end
  
end
