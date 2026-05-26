# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.find_or_create_by!(email: "test@example.com") do |u|
  u.password = "password123"
end

chat = Chat.find_or_create_by!(title: "Recommandations sneakers", user: user)

Message.find_or_create_by!(chat: chat, role: "assistant", content: "Nike Air Max 90 — Un classique indémodable.", image_url: "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400")

Message.find_or_create_by!(chat: chat, role: "assistant", content: "New Balance 990 — Confort ultime pour le running urbain.", image_url: "https://images.unsplash.com/photo-1539185441755-769473a23570?w=400")

Message.find_or_create_by!(chat: chat, role: "assistant", content: "Converse Chuck Taylor — L'icône intemporelle du style casual.", image_url: "https://images.unsplash.com/photo-1463100099107-aa0980c362e6?w=400")

Message.find_or_create_by!(chat: chat, role: "assistant", content: "Vans Old Skool — La référence skate qui ne se démode pas.", image_url: "https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?w=400")

Message.find_or_create_by!(chat: chat, role: "assistant", content: "Puma Suede Classic — Élégance rétro garantie.", image_url: "https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?w=400")

Message.find_or_create_by!(chat: chat, role: "assistant", content: "Jordan 1 Retro High — Le graal des sneakerheads.", image_url: "https://images.unsplash.com/photo-1607522370275-f14206abe5d3?w=400")

Message.find_or_create_by!(chat: chat, role: "assistant", content: "Asics Gel-Lyte III — Performance et style rétro.", image_url: "https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=400")

Message.find_or_create_by!(chat: chat, role: "assistant", content: "Saucony Jazz Original — La perle discrète des connaisseurs.", image_url: "https://images.unsplash.com/photo-1491553895911-0055eca6402d?w=400")

puts "Recommandations chargées en base !"
