puts "Nettoyage de la base de données..."
# éviter les conflits de dépendance
Message.destroy_all
Chat.destroy_all
User.destroy_all

puts "Création de l'utilisateur Léo..."
leo = User.create!(
  email: "leo@test.com",
  password: "password",
  password_confirmation: "password"
)

puts "Création de l'historique des chats..."
chat1 = Chat.create!(title: "Authentification Jordan 1 High", user: leo)
Message.create!(chat: chat1, role: "user", content: "Peux-tu me dire si cette paire de Jordan 1 est authentique ?")
Message.create!(chat: chat1, role: "assistant", content: "Bien sûr, d'après mon analyse des coutures, cette paire semble authentique.")

chat2 = Chat.create!(title: "Check Yeezy 350 V2", user: leo)
Message.create!(chat: chat2, role: "user", content: "J'ai un doute sur l'étiquette de ces Yeezy.")
Message.create!(chat: chat2, role: "assistant", content: "L'espacement des lettres sur l'étiquette intérieure indique une contrefaçon probable.")

chat3 = Chat.create!(title: "Analyse Nike Dunk Low", user: leo)
Message.create!(chat: chat3, role: "user", content: "Est-ce que le logo Nike est correct ici ?")
Message.create!(chat: chat3, role: "assistant", content: "Le swoosh est légèrement mal proportionné, c'est suspect.")

puts "Base de données créée avec succès !"
