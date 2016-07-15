class BookDecorator < Draper::Decorator
  delegate_all
  
  def reviews
    object.reviews.where(approved: true)
  end
end
