require 'rails_helper'

describe ConversationSerializer do
  include ActionView::Helpers
  include Rails.application.routes.url_helpers

  let(:conversation) { FactoryGirl.build(:conversation) }
  let(:serializer) { described_class.new(conversation) }
  let(:body) { "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce in malesuada lectus, a rhoncus mi. Nulla accumsan pellentesque leo non consequat. Quisque sit amet consequat nulla. Maecenas dapibus nisi nibh, quis sagittis arcu laoreet vitae. Quisque elit felis, bibendum ut ex sit amet nullam sodales." }

  describe '#preview' do
    let(:message) { FactoryGirl.build(:message, body: body) }

    before do
      conversation.messages = [message]
    end

    subject { serializer.preview }

    it { is_expected.to eq truncate(body, length: 300) }
  end

  describe '#author' do
    subject { serializer.author }

    it { is_expected.to eq conversation.user.username }
  end

  describe '#time_ago' do
    subject { serializer.time_ago }

    before do
      conversation.save
      Timecop.freeze Time.local(2017)
    end

    it { is_expected.to eq distance_of_time_in_words(conversation.created_at, Time.now) }
  end

  describe '#show_link' do
    let(:message) { FactoryGirl.build(:message, body: body) }

    before do
      conversation.messages = [message]
      conversation.save
    end

    subject { serializer.show_link }

    it { is_expected.to eq link_to(serializer.preview, conversation_path(conversation)) }
  end
end
