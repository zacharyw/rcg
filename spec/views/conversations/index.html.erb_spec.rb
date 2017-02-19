require 'rails_helper'

describe "conversations/index.html.erb", type: :view do
  let(:conversation) { FactoryGirl.create(:conversation) }
  let(:presenter) { ConversationPresenter.new(conversation) }
  let(:user) { nil }
  
  before do
    sign_in user unless user.blank?
    assign(:conversations, [conversation])
    assign(:new_conversation, Forms::Conversation.new)
    render
  end

  it 'Renders conversations' do
    expect(rendered).to have_content presenter.author
    expect(rendered).to have_content presenter.preview(self)
  end

  context 'When logged out' do
    it 'Does not render new form' do
      expect(rendered).not_to have_css "form#new_conversation"
    end
  end

  context 'When logged in 'do
    let(:user) { FactoryGirl.create(:user) }

    it 'Does renders new form' do
      expect(rendered).to have_css "form#new_conversation"
    end
  end
end
