class AuthorDecorator < Draper::Decorator
  delegate_all
  delegate :author
  
  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end