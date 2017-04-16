require 'rails_helper'

feature "Conversations list", js: true do
  include ConversationSteps

  let(:conversation) { FactoryGirl.create(:conversation) }

  let(:serializer) { ConversationSerializer.new(conversation) }
  let(:user) { FactoryGirl.create(:user) }

  before do
    conversation.messages.reload
  end

  scenario 'User visits conversations page and creates a conversation' do
    visit conversations_path

    expect(page).not_to have_new_form

    expect(page).to have_content serializer.author
    expect(page).to have_content serializer.preview

    log_in_as(user)

    visit conversations_path

    expect(page).to have_content serializer.author
    expect(page).to have_content serializer.preview

    post_conversation("Testing new convo")
    
    expect(page).to have_content "#{user.username} less than a minute ago"
    within "#conversation_#{Conversation.last.id}" do
      expect(page).to have_content "Testing new convo"
    end
  end
end
