FactoryGirl.define do
  factory :message do
    user
    conversation
    body "Test"
  end
end
