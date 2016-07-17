require 'rails_helper'

RSpec.describe OrderBook, type: :model do
  it { is_expected.to delegate_method(:update_order).to(:order) }
  it { is_expected.to delegate_method(:title).to(:book).with_prefix }
  
  context "validations" do 
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:quantity) }
  end
  
  context "associations" do
    it { is_expected.to belong_to(:book) }
    it { is_expected.to belong_to(:order) }
  end
  
  describe '#subtotal' do
    it 'returns quantity * price' do
      order_book = FactoryGirl.create(:order_book, quantity: 2)
      expect(order_book.subtotal).to eq(3)
    end
  end
end
