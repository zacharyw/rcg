require 'rails_helper'

describe MessageSavor do
  describe '#perform' do
    let!(:conversation) { FactoryGirl.create(:conversation) }
    let(:user) { FactoryGirl.create(:user) }
    let(:broadcaster) { double(MessageBroadcaster) }

    subject { described_class.new(body: 'Testing Savor', conversation_id: conversation.id, user: user).perform }

    it 'Saves and broadcasts' do
      expect(MessageBroadcaster).to receive(:new).and_return(broadcaster)
      expect(broadcaster).to receive(:perform)
      
      expect { subject }.to change{ Message.count }.by 1
      
      expect(Message.last.body).to eq 'Testing Savor'
      expect(Message.last.conversation).to eq conversation
      expect(Message.last.user).to eq user
    end
  end
end
