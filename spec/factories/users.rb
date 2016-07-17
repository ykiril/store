FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "example#{n}@test.com" }
    password 'qwerty12'
    password_confirmation 'qwerty12'
    provider nil
    uid nil
    username 'test_user'
    billing_address nil
    shipping_address nil
  end
end
