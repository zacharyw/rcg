require 'rails_helper'

describe ReadConversation, type: :model do
  describe 'validations' do
    subject { read_conversation.valid? }

    describe 'User presence' do
      let(:read_conversation) { ReadConversation.new(conversation: Conversation.new, read_at: DateTime.now) }

      it { is_expected.to eq false }

      context 'When user is present' do
        before do
          read_conversation.user = User.new
        end

        it { is_expected.to eq true }
      end
    end

    describe 'Conversation presence' do
      let(:read_conversation) { ReadConversation.new(user: User.new, read_at: DateTime.now) }

      it { is_expected.to eq false }

      context 'When Conversation is present' do
        before do
          read_conversation.conversation = Conversation.new
        end

        it { is_expected.to eq true }
      end
    end

    describe 'read_at presence' do
      let(:read_conversation) { ReadConversation.new(user: User.new, conversation: Conversation.new) }

      it { is_expected.to eq false }

      context 'When read_at is present' do
        before do
          read_conversation.read_at = DateTime.now
        end

        it { is_expected.to eq true }
      end
    end
  end
end
