require 'rails_helper'

describe ConversationOpener do
  describe '#perform' do
    let(:conversation) { FactoryGirl.create(:conversation) }
    let(:user) { FactoryGirl.create(:user) }
    let(:read_conversation) { ReadConversation.last }

    subject { described_class.new(id: conversation.id, user: user).perform }

    it 'Marks conversation read for given user' do
      expect{ subject }.to(change{ReadConversation.count}.by(1))
      expect(read_conversation.user).to eq user
      expect(read_conversation.conversation).to eq conversation
      expect(read_conversation.read_at).not_to be_nil
    end

    it 'Returns conversation' do
      expect(subject).to eq conversation
    end
  end
end
