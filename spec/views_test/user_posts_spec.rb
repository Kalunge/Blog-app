require 'rails_helper'
# rubocop:disable Metrics/BlockLength, Layout/LineLength
RSpec.feature 'User Index', type: :feature do
  background { visit new_user_session_path }
  scenario "I can see the user's profile picture." do
    @user1 = User.create(Name: 'Titus', email: 'eliam@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: "I'm a good person")
    @user2 = User.create(Name: 'Julie', email: 'julie@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: 'Software engineer')

    Post.create(Title: 'hello there', Text: 'Etiam et mauris et', user_id: @user2.id)
    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user2.id)}']").click
    find("a[href='#{user_posts_path(@user2.id)}']").click
    expect(find('img') do |img|
             img[:src] == 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg'
           end).to be_truthy
  end

  scenario "I can see the user's userName." do
    @user1 = User.create(Name: 'Titus', email: 'titus@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: "I'm a good person")
    @user2 = User.create(Name: 'Julie', email: 'son@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: 'Software engineer')

    Post.create(Title: 'hello there', Text: 'Etiam et mauris et', user_id: @user2.id)

    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user2.id)}']").click
    find("a[href='#{user_posts_path(@user2.id)}']").click
    expect(page).to have_content 'Julie'
  end

  scenario 'I can see the number of posts the user has written' do
    @user1 = User.create(Name: 'Titus', email: 'titus@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: "I'm a good person")
    @user2 = User.create(Name: 'Julie', email: 'kimte@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: 'Software engineer')

    Post.create(Title: 'hello there', Text: 'Etiam et mauris et', user_id: @user2.id)

    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user2.id)}']").click
    find("a[href='#{user_posts_path(@user2.id)}']").click
    expect(page).to have_content "Number of posts: #{@user2.posts.size}"
  end

  scenario " can see a post's Title." do
    @user = User.create!(Name: 'Julie', email: 'fay@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: 'Software engineer')

    @post = @user.posts.create!(Title: 'hello there', Text: 'Etiam et mauris et', CommentsCounter: 0, LikesCounter: 0)

    within 'form' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user.id)}']").click
    find("a[href='#{user_posts_path(@user.id)}']").click
    expect(page).to have_content @post.Title
  end

  scenario " can see some of the post's body." do
    @user = User.create!(Name: 'Julie', email: 'sue@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: 'Software engineer')

    @post = @user.posts.create!(Title: 'hello there', Text: 'Etiam et mauris et', CommentsCounter: 0, LikesCounter: 0)

    within 'form' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user.id)}']").click
    find("a[href='#{user_posts_path(@user.id)}']").click
    expect(page).to have_content @post.Text
  end

  scenario 'can see the first comments on a post.' do
    @user = User.create(Name: 'Julie', email: 'jeri@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                        photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: 'Software engineer')

    @post = @user.posts.create(Title: 'hello there', Text: 'Etiam et mauris et', CommentsCounter: 0, LikesCounter: 0)
    @comment = @post.comments.create(text: 'consectetur adipiscing e mollislibero non urna', user_id: @user.id)

    within 'form' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user.id)}']").click
    find("a[href='#{user_posts_path(@user.id)}']").click
    expect(page).to have_content @comment.text
  end

  scenario 'I can see how many comments a post has.' do
    @user = User.create!(Name: 'Julie', email: 'simith@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: 'Software engineer')

    @post = @user.posts.create!(Title: 'hello there', Text: 'Etiam et mauris et', CommentsCounter: 0, LikesCounter: 0)
    @coment1 = @post.comments.create(text: ' consectetur adipiscing e mollislibero non urna', user_id: @user.id)
    @coment2 = @post.comments.create(text: ' second comment', user_id: @user.id)
    @coment3 = @post.comments.create(text: ' third comment', user_id: @user.id)

    within 'form' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user.id)}']").click
    find("a[href='#{user_posts_path(@user.id)}']").click
    expect(page).to have_content "comments : #{@post.comments.size}"
  end

  scenario ' can see how many likes a post has.' do
    @user = User.create(Name: 'Julie', email: 'manu@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                        photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: 'Software engineer')

    @post = @user.posts.create!(Title: 'hello there', Text: 'Etiam et mauris et', CommentsCounter: 0, LikesCounter: 0)
    Like.create!(user_id: @user.id, post_id: @post.id)

    within 'form' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user.id)}']").click
    find("a[href='#{user_posts_path(@user.id)}']").click
    expect(page).to have_content 'likes : 1'
  end

  scenario 'I can see a section for pagination if there are more posts than fit on the view.' do
    @user1 = User.create(Name: 'Titus', email: 'titus@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: "I'm a good person")
    @user2 = User.create(Name: 'Julie', email: 'sam@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: 'Software engineer')

    @post = Post.create(Title: 'hello there', Text: 'Etiam et mauris et', user_id: @user2.id)
    @coment1 = Comment.create(text: ' consectetur adipiscing e mollislibero non urna', user_id: @user2.id,
                              post_id: @post.id)
    @coment2 = Comment.create(text: ' second comment', user_id: @user2.id, post_id: @post.id)
    @coment3 = Comment.create(text: ' third comment', user_id: @user2.id, post_id: @post.id)
    @coment33 = Comment.create(text: ' third comment', user_id: @user2.id, post_id: @post.id)
    @coment32 = Comment.create(text: ' third comment', user_id: @user2.id, post_id: @post.id)

    within 'form' do
      fill_in 'Email', with: @user2.email
      fill_in 'Password', with: @user2.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user2.id)}']").click
    find("a[href='#{user_posts_path(@user2.id)}']").click
    expect(page.has_button?('Pagination')).to be true
  end

  scenario "When I click on a post, it redirects me to that post's show page." do
    @user = User.create!(Name: 'Julie', email: 'eric@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: 'Software engineer')
    @user2 = User.create!(Name: 'Julie', email: 'mine@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                          photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: 'Software engineer')

    @post = @user.posts.create!(Title: 'hello there', Text: 'Etiam et mauris et', CommentsCounter: 0, LikesCounter: 0)
    @coment = @post.comments.create(text: ' consectetur adipiscing e mollislibero non urna', user_id: @user.id)

    within 'form' do
      fill_in 'Email', with: @user2.email
      fill_in 'Password', with: @user2.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user.id)}']").click
    find("a[href='#{user_posts_path(@user.id, @post.id)}']").click
    expect(page).to have_content @post.Text
  end
  # rubocop:enable Metrics/BlockLength, Layout/LineLength
end
