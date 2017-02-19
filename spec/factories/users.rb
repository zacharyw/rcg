FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com"}
    sequence(:username) { |n| "username#{n}"}
    password '123456789'
    password_confirmation '123456789'
  end
end
