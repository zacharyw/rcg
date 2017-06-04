FactoryGirl.define do
  factory :read_conversation do
    user
    conversation
    read_at DateTime.now
  end
end
