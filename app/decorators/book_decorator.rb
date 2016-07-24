class BookDecorator < Draper::Decorator
  delegate_all
  delegate :full_name, to: :author, prefix: true, allow_nil: true
  
  decorates_association :author
  
  def reviews
    object.reviews.where(approved: true)
  end
  
  def author_name
    object.author.first.full_name
  end
end
