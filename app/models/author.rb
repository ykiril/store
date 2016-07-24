class Author < ActiveRecord::Base
  validates :first_name, :last_name, presence: true
  has_many :books

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
