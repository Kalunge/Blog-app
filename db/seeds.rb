# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

7.times do | time |
  new_user = User.create(
    Name: "John #{time}",
    Bio: "I am #{time * 5} years old"
  )
  # posts for user
  4.times do | i |
    new_post = Post.create(
      Title: "post number #{i}",
      Text: "I live in house number #{i * 2}",
      user: new_user
    )
    # new_post.CommentsCounter = new_post.comments.count
    # new_post.LikesCounter = new_post.likes.count

    3.times do | comm |
      Comment.create(
        text: "number #{comm} to comment",
        user: new_user,
        post: new_post
      )
    end
  end
end