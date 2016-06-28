class AddUserToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :user, foreign_key: true, index: true
  end
end
