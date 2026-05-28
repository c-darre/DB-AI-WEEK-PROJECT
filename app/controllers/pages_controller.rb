class PagesController < ApplicationController
  # Si Devise est configuré pour bloquer tout le site par défaut,
  # je m'assure que la home reste accessible aux visiteurs non connectés
  skip_before_action :authenticate_user!, only: [ :home ], raise: false

  def home
    if user_signed_in?
      # 1. Je cherche un chat qui m'appartient et qui n'a aucun message (pour ne pas polluer la base de données)
      @chat = current_user.chats.find { |c| c.messages.empty? }

      # 2. Si je n'en trouve pas, j'en crée un silencieusement
      @chat ||= current_user.chats.create(title: "Nouvelle analyse")

      # 3. Je prépare le message pour le formulaire
      @message = Message.new
    end
  end
end
