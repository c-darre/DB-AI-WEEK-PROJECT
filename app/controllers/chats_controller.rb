class ChatsController < ApplicationController
  def new
    @chat = Chat.new
  end

  def index
    @chats = current_user.chats

    if params[:query].present?
      @chats = @chats
        .left_joins(:messages)
        .where(
          "chats.title ILIKE :query OR messages.content ILIKE :query",
          query: "%#{params[:query]}%"
        )
        .distinct
    end

    @chats = @chats.order(created_at: :desc)
  end

  def show
    @chat = current_user.chats.find(params[:id])
    @message = Message.new
  end

  def create
    @chat = Chat.new(title: "Untitled")
    @chat.user = current_user

    if @chat.save
      redirect_to chat_path(@chat)
    else
      @chats = current_user.chats.order(created_at: :desc)
      render "chats/show", status: :unprocessable_entity
    end
  end
end
