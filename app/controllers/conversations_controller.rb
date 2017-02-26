class ConversationsController < ApplicationController
  def index
    @conversations = ConversationsFetcher.new.perform
    @new_conversation = NewConversation.new
  end

  def create
    @new_conversation = NewConversation.new(conversation_params)
    
    if @new_conversation.valid?
      conversation = @new_conversation.perform
      conversation.user = current_user
      conversation.save!

      redirect_to conversations_path
    else
      @conversations = ConversationsFetcher.new.perform
      render :index
    end
  end

  def show
  end

  def destroy
  end

  private
  def conversation_params
    params.require(:conversation).permit(:body)
  end
end
