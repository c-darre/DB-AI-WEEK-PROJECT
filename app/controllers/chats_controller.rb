class ChatsController < ApplicationController

  def new
    @chats = Chat.new
  end
  def index
    # Je récupère uniquement les chats du "current_user" (l'utilisateur connecté)
    @chats = current_user.chats.order(created_at: :desc)
  end

  # Je prépare l'action show pour Alicia qui gère l'affichage d'un chat unique
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
      @chats = chats.where(user: current_user)
      render "chats/show"
    end
  end


end
