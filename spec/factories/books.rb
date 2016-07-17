require 'ffaker'

FactoryGirl.define do
  factory :book do
    title FFaker::Product.product_name
    description FFaker::Lorem.paragraph
    price 5.5
    in_stock 15
    author
    category nil
    
    factory :book_with_order do
      transient do
        quantity 1
      end
    end
  end
end
