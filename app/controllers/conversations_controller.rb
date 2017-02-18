class ConversationsController < ApplicationController
  def index
    @conversations = ConversationDecorator.decorate_collection(Conversation.all)
  end

  def new
    @conversation = Conversation.new
  end

  def create
  end

  def show
  end

  def destroy
  end
end
