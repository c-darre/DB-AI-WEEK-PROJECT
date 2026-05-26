class Chat < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :recommendations, dependent: :destroy

  DEFAULT_TITLE = "Untitled"

  TITLE_PROMPT = <<~PROMPT
    Génère un titre court et descriptif de 3 à 6 mots qui résume la demande de l'utilisateur pour une conversation sur des sneakers. Ne mets pas de guillemets.
  PROMPT

  def generate_title_from_first_message
    return unless title == DEFAULT_TITLE || title.blank?

    first_user_message = messages.where(role: "user").order(:created_at).first
    return if first_user_message.nil?

    response = RubyLLM.chat.with_instructions(TITLE_PROMPT).ask(first_user_message.content)
    update(title: response.content)
  end
end
