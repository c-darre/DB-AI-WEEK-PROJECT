require "open-uri"

puts "Nettoyage de la base de données..."
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
msg1 = Message.create!(chat: chat1, role: "user", content: "Peux-tu me dire si cette paire de Jordan 1 est authentique ?")
msg1.photo.attach(
  io: URI.open("https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400"),
  filename: "jordan1.jpg",
  content_type: "image/jpeg"
)
Message.create!(chat: chat1, role: "assistant", content: "Bien sûr, d'après mon analyse des coutures, cette paire semble authentique.")

chat2 = Chat.create!(title: "Check Yeezy 350 V2", user: leo)
msg2 = Message.create!(chat: chat2, role: "user", content: "J'ai un doute sur l'étiquette de ces Yeezy.")
msg2.photo.attach(
  io: URI.open("https://images.unsplash.com/photo-1608231387042-66d1773d3028?w=400"),
  filename: "yeezy350.jpg",
  content_type: "image/jpeg"
)
Message.create!(chat: chat2, role: "assistant", content: "L'espacement des lettres sur l'étiquette intérieure indique une contrefaçon probable.")

chat3 = Chat.create!(title: "Analyse Nike Dunk Low", user: leo)
msg3 = Message.create!(chat: chat3, role: "user", content: "Est-ce que le logo Nike est correct ici ?")
msg3.photo.attach(
  io: URI.open("https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?w=400"),
  filename: "nikedunk.jpg",
  content_type: "image/jpeg"
)
Message.create!(chat: chat3, role: "assistant", content: "Le swoosh est légèrement mal proportionné, c'est suspect.")

puts "Base de données créée avec succès !"
