require 'rails_helper'

describe Message, type: :model do
  describe 'validations' do
    subject { message.valid? }
    
    describe 'User presence' do
      let(:message) { Message.new(conversation: Conversation.new) }

      it { is_expected.to eq false }

      context 'When user is present' do
        before do
          message.user = User.new
        end

        it { is_expected.to eq true }
      end
    end

    describe 'Conversation presence' do
      let(:message) { Message.new(user: User.new) }

      it { is_expected.to eq false }

      context 'When conversation is present' do
        before do
          message.conversation = Conversation.new
        end

        it { is_expected.to eq true }
      end
    end
  end
end
