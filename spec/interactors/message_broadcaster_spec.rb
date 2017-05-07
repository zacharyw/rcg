require 'rails_helper'

describe MessageBroadcaster do

  describe '#perform' do
    let(:json) { MessageSerializer.new(message).to_json }
    let(:message) { FactoryGirl.build_stubbed(:message) }

    subject { described_class.new(message: message).perform }

    it 'Broadcasts message to conversation' do
      expect(MessagesChannel).to receive(:broadcast_to).with(message.conversation, json)

      subject
    end
  end
end
