require 'rails_helper'

feature "Conversations list", js: true do
  include ConversationSteps
  
  let!(:conversation) { FactoryGirl.create(:conversation) }

  let(:serializer) { ConversationSerializer.new(conversation) }
  let(:user) { FactoryGirl.create(:user) }

  scenario 'User visits conversations page and creates a conversation' do
    visit conversations_path

    expect(page).not_to have_new_form

    expect(page).to have_content serializer.author
    expect(page).to have_content serializer.preview

    log_in_as(user)

    visit conversations_path

    expect(page).to have_content serializer.author
    expect(page).to have_content serializer.preview

    write_conversation("Testing new convo")
    post_conversation

    expect(page).to have_content "Testing new convo"
    expect(page).to have_content user.username
  end
end
