require 'rails_helper'

feature "Chatroom", js: true do
  let!(:conversation) { FactoryGirl.create(:conversation) }
  let(:serialized_conversation) { ConversationSerializer.new(conversation) }
  let(:user) { FactoryGirl.create(:user) }

  scenario 'User enters chatroom and sends a message' do
    log_in_as(user)
    
    visit conversations_path

    click_link serialized_conversation.preview

    expect(page).to have_content conversation.messages.first.body

    fill_in 'new-message-body', with: 'New message'
    click_on 'Send'

    expect(page).to have_content "#{user.username}: New message"
  end
end
