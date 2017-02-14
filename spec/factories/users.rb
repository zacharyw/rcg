FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@rcg.com"
  end

  sequence :username do |n|
    "username#{n}"
  end
  
  factory :user do
    email
    username
    password '123456789'
    password_confirmation '123456789'
  end
end
