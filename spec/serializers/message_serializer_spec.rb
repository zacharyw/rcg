require 'rails_helper'

describe MessageSerializer do
  let(:message) { FactoryGirl.build_stubbed(:message) }
  let(:serializer) { described_class.new(message) }

  describe '#as_json' do
    let(:expected) do
      {
        body: message.body,
        id: message.id,
        author: message.user.username
      }
    end

    subject { serializer.as_json }

    it { is_expected.to include(expected) }
  end
end
