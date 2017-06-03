require 'rails_helper'

feature "Chatroom", js: true do
  include ConversationSteps
  
  let!(:conversation) { FactoryGirl.create(:conversation) }
  let(:serialized_conversation) { ConversationSerializer.new(conversation) }
  let(:user) { FactoryGirl.create(:user) }

  scenario 'User enters chatroom and sends a message' do
    log_in_as(user)
    
    visit conversations_path

    click_link "conversation-#{conversation.id}-link"

    expect(page).to have_content conversation.messages.first.body

    send_message "New message"

    expect(page).to have_content "#{user.username}: New message"
  end
end
