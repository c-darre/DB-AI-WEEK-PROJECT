class Chat < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy

  # Le prompt IA dédié uniquement à la création du titre
  TITLE_PROMPT = <<~PROMPT
    Génère un titre court et descriptif de 3 à 6 mots qui résume la demande de l'utilisateur pour une conversation sur des sneakers. Ne mets pas de guillemets.
  PROMPT

  def generate_title_from_first_message
    # On évite de regénérer le titre s'il a déjà été personnalisé
    return unless title == "Untitled" || title == "Nouvelle analyse" || title.blank?

    # On récupère le tout premier message envoyé par l'utilisateur
    first_user_message = messages.where(role: "user").order(:created_at).first
    return if first_user_message.nil?

# --- INJECTION MANUELLE ---
    # On force la création de l'instance avec la clé lue directement depuis ENV
    # Si ENV est vide ici, le problème est dans le chargement de ton .env
    token = ENV['GITHUB_TOKEN']

    # Si le token est vide, on lève une erreur explicite pour comprendre
    raise "GITHUB_TOKEN est vide dans ENV !" if token.blank?


    # On demande à l'IA de générer le titre avec le modèle rapide
    # (Pas besoin du modèle vision gpt-4o juste pour résumer du texte)
    response = RubyLLM.chat.with_instructions(TITLE_PROMPT).ask(first_user_message.content)

    # On met à jour le titre dans la base de données
    update(title: response.content)
  end
end
