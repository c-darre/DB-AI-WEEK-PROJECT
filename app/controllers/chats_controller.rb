class ChatsController < ApplicationController
  def index
    # Je récupère uniquement les chats du "current_user" (l'utilisateur connecté)
    @chats = current_user.chats.order(created_at: :desc)
  end

  # Je prépare l'action show pour Alicia qui gère l'affichage d'un chat unique
  def show
    @chat = current_user.chats.find(params[:id])
  end
end
