require 'rails_helper'

describe MessageBroadcaster do

  describe '#perform' do
    let(:serialized_message) { double(ActiveModelSerializers::SerializableResource) }
    let(:json) { double }
    let(:message) { FactoryGirl.build_stubbed(:message) }

    subject { described_class.new(message: message).perform }

    it 'Broadcasts message to conversation' do
      expect(ActiveModelSerializers::SerializableResource).to receive(:new).with(message).and_return(serialized_message)
      expect(serialized_message).to receive(:to_json).and_return json
      expect(MessagesChannel).to receive(:broadcast_to).with(message.conversation, json)

      subject
    end
  end
end
