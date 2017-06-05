require 'rails_helper'

describe ConversationReadMarker do
  describe '#perform' do
    let(:conversation) { FactoryGirl.create(:conversation) }
    let(:user) { FactoryGirl.create(:user) }

    before do
      Timecop.freeze Time.local(2017)
    end
    
    subject { described_class.new(conversation: conversation, user: user).perform }

    it 'Creates new ReadConversation' do
      expect{ subject }.to(change {ReadConversation.count}.from(0).to(1))
      expect(ReadConversation.last.user).to eq user
      expect(ReadConversation.last.conversation).to eq conversation
      expect(ReadConversation.last.read_at).to eq DateTime.now
    end

    context 'When ReadConversation already exists' do
      let(:read_conversation) do
        FactoryGirl.create(:read_conversation, conversation: conversation, user: user, read_at: 2.days.ago)
      end

      it 'Updates with fresh timestamp' do
        expect{ subject }.to(change{ read_conversation.reload.read_at }.to(DateTime.now))
      end
    end
  end
end
