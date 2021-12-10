# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ Name: 'Titus Muthomi', Bio: "I am a software developer" }, { Name: 'John Doe', Bio: "I am a software developer" }, { Name: 'Faith Muthomi', Bio: "I am a fullstack software developer" }, { Name: 'Eric Muthomi', Bio: "I am a backend software developer" }])
posts = Post.create([{ Title: 'Software development', user: users.first, Text: "Writing code is my passion" }, { Title: 'Coding', user: users.last, Text: "welcoming to my new blog" }, { Title: 'Test post', user: users.first, Text: "hello from my post" }, { Title: 'Devops', user: users.last, Text: "I am a backend software developer" }])
comments = Comment.create([{ text: 'Software development', user_id: users.first.id, post_id: posts.first.id }, { text: 'Coding', user_id: users.last.id, post_id: posts.last.id }, { text: 'Test post', user_id: users.first.id, post_id: posts.first.id }, { text: 'Devops', user_id: users.last.id, post_id: posts.first.id }])