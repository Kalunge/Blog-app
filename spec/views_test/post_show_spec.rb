require 'rails_helper'
# rubocop:disable Metrics/BlockLength, Layout/LineLength
RSpec.feature 'Posts Show', type: :feature do
  background { visit new_user_session_path }

  scenario "I can see the post's title." do
    @user = User.create(Name: 'Jack', email: 'Jack@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                        photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: 'Software engineer')

    @post = @user.posts.create(Title: 'hello my dear', Text: 'Etiam et mauris et', CommentsCounter: 0, LikesCounter: 0)

    within 'form' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user.id)}']").click
    find("a[href='#{user_posts_path(@user.id)}']").click
    find("a[href='#{user_post_path(@user.id, @post.id)}']").click
    expect(page).to have_content @post.Title
  end

  scenario 'I can see who wrote the post.' do
    @user = User.create(Name: 'Backster', email: 'bae@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                        photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: 'Software engineer')

    @post = @user.posts.create(Title: 'hello there', Text: 'Etiam et mauris et', CommentsCounter: 0, LikesCounter: 0)

    within 'form' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user.id)}']").click
    find("a[href='#{user_posts_path(@user.id)}']").click
    find("a[href='#{user_post_path(@user.id, @post.id)}']").click
    expect(page).to have_content @user.Name
  end

  scenario 'I can see how many comments it has.' do
    @user = User.create(Name: 'Backster', email: 'bae@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                        photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: 'Software engineer')

    @post = @user.posts.create(Title: 'hello there', Text: 'Etiam et mauris et', CommentsCounter: 0, LikesCounter: 0)

    @coment = @post.comments.create(text: ' consectetur adipiscing e mollislibero non urna', user_id: @user.id)
    within 'form' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user.id)}']").click
    find("a[href='#{user_posts_path(@user.id)}']").click
    find("a[href='#{user_post_path(@user.id, @post.id)}']").click
    expect(page).to have_content "comments : #{@post.comments.size}"
  end

  scenario 'I can see how many likes it has.' do
    @user = User.create(Name: 'Backster', email: 'bae@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                        photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: 'Software engineer')

    @post = @user.posts.create(Title: 'hello there', Text: 'Etiam et mauris et', CommentsCounter: 0, LikesCounter: 0)
    Like.create(user_id: @user.id, post_id: @post.id)

    within 'form' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user.id)}']").click
    find("a[href='#{user_posts_path(@user.id)}']").click
    find("a[href='#{user_post_path(@user.id, @post.id)}']").click
    expect(page).to have_content 'likes : 1'
  end

  scenario 'I can see the post body.' do
    @user = User.create(Name: 'Backster', email: 'bae@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                        photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: 'Software engineer')

    @post = @user.posts.create(Title: 'hello there', Text: 'Etiam et mauris et', CommentsCounter: 0, LikesCounter: 0)
    Like.create(user_id: @user.id, post_id: @post.id)

    within 'form' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user.id)}']").click
    find("a[href='#{user_posts_path(@user.id)}']").click
    find("a[href='#{user_post_path(@user.id, @post.id)}']").click
    expect(page).to have_content @post.Text
  end

  scenario 'I can see the username of each commentor.' do
    @user = User.create(Name: 'Backster', email: 'bae@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                        photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: 'Software engineer')

    @post = @user.posts.create(Title: 'hello there', Text: 'Etiam et mauris et', CommentsCounter: 0, LikesCounter: 0)
    @coment1 = @post.comments.create(text: ' consectetur adipiscing e mollislibero non urna', user_id: @user.id)
    @coment2 = @post.comments.create(text: ' second comment', user_id: @user.id)
    @coment3 = @post.comments.create(text: ' third comment', user_id: @user.id)
    Like.create(user_id: @user.id, post_id: @post.id)

    within 'form' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user.id)}']").click
    find("a[href='#{user_posts_path(@user.id)}']").click
    find("a[href='#{user_post_path(@user.id, @post.id)}']").click
    expect(page).to have_content @user.Name
    expect(page).to have_content @user.Name
  end

  scenario 'I can see the comment each commentor left.' do
    @user = User.create(Name: 'Backster', email: 'bae@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                        photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: 'Software engineer')

    @post = @user.posts.create(Title: 'hello there', Text: 'Etiam et mauris et', CommentsCounter: 0, LikesCounter: 0)
    @coment1 = @post.comments.create(text: ' consectetur adipiscing e mollislibero non urna', user_id: @user.id)
    Like.create(user_id: @user.id)

    within 'form' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user.id)}']").click
    find("a[href='#{user_posts_path(@user.id)}']").click
    find("a[href='#{user_post_path(@user.id, @post.id)}']").click
    expect(page).to have_content @coment1.text
  end
  # rubocop:enable Metrics/BlockLength, Layout/LineLength
end
