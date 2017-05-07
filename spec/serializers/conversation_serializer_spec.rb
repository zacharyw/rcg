require 'rails_helper'

describe ConversationSerializer do
  include ActionView::Helpers
  include Rails.application.routes.url_helpers

  let(:conversation) { FactoryGirl.build(:conversation) }
  let(:serializer) { described_class.new(conversation) }
  let(:body) { "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce in malesuada lectus, a rhoncus mi. Nulla accumsan pellentesque leo non consequat. Quisque sit amet consequat nulla. Maecenas dapibus nisi nibh, quis sagittis arcu laoreet vitae. Quisque elit felis, bibendum ut ex sit amet nullam sodales." }

  let(:message) { FactoryGirl.build(:message, body: body) }

  before do
    Timecop.freeze Time.local(2017)
    conversation.messages = [message]
    conversation.save
  end

  describe '#as_json' do
    let(:expected) do
      {
          id: conversation.id,
          preview: truncate(body, length: 300),
          author: conversation.user.username,
          time_ago: distance_of_time_in_words(conversation.created_at, Time.now),
          show_link: link_to(serializer.preview, conversation_path(conversation))
      }
    end

    subject { serializer.as_json }

    it { is_expected.to include(expected) }
  end
end
