require 'rails_helper'

describe Conversation, type: :model do
  describe 'Validations' do
    subject { conversation.valid? }

    describe 'User presence validation' do
      let(:conversation) do
        conversation = Conversation.new
        message = FactoryGirl.build(:message, conversation: conversation)
        conversation.messages = [message]
        conversation
      end

      it { is_expected.to eq false }

      context 'When user is set' do
        before do
          conversation.user = User.new
        end

        it { is_expected.to eq true }
      end
    end

    describe 'At least one message' do
      let(:conversation) do
        Conversation.new(user: User.new)
      end

      it { is_expected.to eq false }

      context 'When message exists' do
        before do
          message = FactoryGirl.build(:message, conversation: conversation)
          conversation.messages = [message]
        end

        it { is_expected. to eq true }
      end
    end
  end

  describe '#broadcast' do
    let(:conversation) { FactoryGirl.build(:conversation) }
    let(:serialized_conversation) { double(ActiveModelSerializers::SerializableResource) }
    let(:json) { double }
    
    it 'Broadcasts after create' do
      expect(ActiveModelSerializers::SerializableResource).to receive(:new).with(conversation).and_return(serialized_conversation)
      expect(serialized_conversation).to receive(:to_json).and_return json
      expect(ConversationChannel).to receive(:broadcast_to).with('conversations', json)
      
      conversation.save
    end

    it 'Does not broadcast after build' do
      expect(ConversationChannel).not_to receive(:broadcast_to)
      conversation
    end
  end
end
