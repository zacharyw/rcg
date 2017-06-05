require 'rails_helper'

describe NewMessageCounter do
  describe '#perform' do
    let!(:read_conversation) { FactoryGirl.create(:read_conversation, read_at: 1.days.ago) }
    let(:conversation) { read_conversation.conversation }
    let(:user) { read_conversation.user }

    before do
      FactoryGirl.create(:message, conversation: conversation, created_at: 2.days.ago)
    end
    
    subject { described_class.new(conversation: conversation, user: user).perform }

    it { is_expected.to eq 1 }

    context 'When no user' do
      let(:user) { nil }

      it { is_expected.to eq 2 }
    end

    context 'When not read yet' do
      let!(:read_conversation) { nil }
      let(:conversation) { FactoryGirl.create(:conversation) }
      let(:user) { FactoryGirl.create(:user) }

      it { is_expected.to eq 2 }
    end
  end
end
