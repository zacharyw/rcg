class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.all
    @new_conversation = Forms::Conversation.new
  end

  def create
    @new_conversation = Forms::Conversation.new(conversation_params)
    
    if @new_conversation.valid?
      conversation = @new_conversation.perform
      conversation.user = current_user
      conversation.save!

      redirect_to conversations_path
    else
      @conversations = Conversation.all
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
