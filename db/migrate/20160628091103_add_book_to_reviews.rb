class AddBookToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :book, foreign_key: true, index: true
  end
end
