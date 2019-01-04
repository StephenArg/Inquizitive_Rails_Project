# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Anonymous", email: "anon123@guest.com", password: "12345")
User.create(name: "Stephen", email: "me@yahoo.com", password: "what1", admin: true)
User.create(name: "Jim", email: "jim@halpert.com", password: "what1")
User.create(name: "Jeremy", email: "jeremy@email.com", password: "what1")
Question.create(question:"What's 1 + 1?", image_url: "https://i.ytimg.com/vi/M2IrP8-P1Bo/hqdefault.jpg", answer: "2", subject: "Math", topic: "Addition")
Question.create(question:"What's 1 + 1?", image_url: "https://i.ytimg.com/vi/M2IrP8-P1Bo/hqdefault.jpg", answer: "2", subject: "Science", topic: "Easy Stuff")
Question.create(question:"What's 2 + 3?", image_url: "https://i.ytimg.com/vi/M2IrP8-P1Bo/hqdefault.jpg", answer: "5", subject: "Math", topic: "Easy Addition")
Post.create(title: "How do I do this?", user_id: 2, description: "How do I open this can of mayonaise?", image_url: "https://i.ytimg.com/vi/M2IrP8-P1Bo/hqdefault.jpg")
Post.create(title: "Help please!", user_id: 3, description: "How do I pet my cat?", image_url: "https://i.ytimg.com/vi/M2IrP8-P1Bo/hqdefault.jpg")
Post.create(title: "Salmon?", user_id: 4, description: "Best way to cook salmon?", image_url: "https://i.ytimg.com/vi/M2IrP8-P1Bo/hqdefault.jpg")
Comment.create(post_id: 1, user_id: 4, message: "Put it under warm water!")
Comment.create(post_id: 1, user_id: 3, message: "No! That doesn't work..")
Comment.create(post_id: 2, user_id: 4, message: "Extend your hand. Place it on cat. Enjoy!")