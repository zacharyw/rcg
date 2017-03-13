class ConversationsController < ApplicationController
  def index
    @conversations = ConversationsFetcher.new.perform
    @new_conversation = NewConversation.new
  end

  def create
    @new_conversation = NewConversation.new(conversation_params)

    respond_to do |format|
      if @new_conversation.valid?
        conversation = @new_conversation.perform
        conversation.user = current_user
        conversation.save!

        format.json { render json: {}, status: :created }
        format.html { redirect_to conversations_path }
      else
        @conversations = ConversationsFetcher.new.perform
        format.json { render json: @new_conversation.errors, status: :unprocessable_entity}
        format.html { render :index }
      end
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
