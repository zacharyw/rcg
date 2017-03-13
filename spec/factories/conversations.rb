FactoryGirl.define do
  factory :conversation do
    user

    transient do
      message_count 1
    end

    after(:create) do |conversation, evaluator|
      create_list(:message, evaluator.message_count, conversation: conversation, user: conversation.user)
    end
  end
end
