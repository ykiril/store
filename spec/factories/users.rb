FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "email#{i}@email.com" }
  end
end
