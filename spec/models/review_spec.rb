require 'rails_helper'

RSpec.describe Review, type: :model do
  context "validations" do 
    it { is_expected.to validate_presence_of(:text_review) }
    it { is_expected.to validate_presence_of(:rating) }
    it { is_expected.to validate_inclusion_of(:rating).in_range(1..5) }
  end
  
  context "associations" do
    it { is_expected.to belong_to(:book) }
    it { is_expected.to belong_to(:user) }
  end
end
