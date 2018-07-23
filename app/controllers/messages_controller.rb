class MessagesController < ApplicationController
  def create
    message = MessageSavor.new(
      body: message_params[:body],
      conversation_id: message_params[:conversation_id],
      user: current_user
    ).perform

    respond_to do |format|
      if message.valid?
        format.json { render json: {}, status: :created }
        format.html { redirect_to conversations_path }
      else
        @conversations = ConversationsFetcher.new.perform
        format.json { render json: message.errors, status: :unprocessable_entity}
        format.html { render :index }
      end
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :conversation_id)
  end
end
