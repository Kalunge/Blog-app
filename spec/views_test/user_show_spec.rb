require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.feature 'Logins', type: :feature do
  background { visit new_user_session_path }

  scenario "I can see the user's profile picture." do
    @user1 = User.create(Name: 'Titus', email: 'titus@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg')
    @user2 = User.create(Name: 'Julie', email: 'julie@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg')

    Post.create(Title: 'Lorem ipsum dolor sit amet', Text: 'Etiam et mauris et ligula', user_id: @user2.id)
    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user2.id)}']").click
    expect(find('img') do |img|
             img[:src] == 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg'
           end).to be_truthy
  end

  scenario "I can see the user's username." do
    @user1 = User.create(Name: 'Titus', email: 'titus@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg')
    @user2 = User.create(Name: 'Julie', email: 'julie@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg')

    Post.create(Title: 'Lorem ipsum dolor sit amet', Text: 'Etiam et mauris et ligula', user_id: @user2.id)
    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user2.id)}']").click
    expect(page).to have_content 'Julie'
  end

  scenario "I can see the number of posts the user has written." do
    @user1 = User.create(Name: 'Titus', email: 'titus@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg')
    @user2 = User.create(Name: 'Julie', email: 'julie@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg')

    Post.create(Title: 'Lorem ipsum dolor sit amet', Text: 'Etiam et mauris et ligula', user_id: @user2.id)
    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user2.id)}']").click
    expect(page).to have_content "Number of posts: #{@user2.posts.size}"
  end

  scenario "can see the user's Bio." do
    @user1 = User.create(Name: 'Titus', email: 'titus@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: "I'm a good person")
    @user2 = User.create(Name: 'Julie', email: 'julie@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: 'Software engineer')

    Post.create(Title: 'Lorem ipsum dolor sit amet', Text: 'Etiam et mauris et ligula', user_id: @user2.id)
    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user2.id)}']").click
    expect(page).to have_content @user2.Bio
  end

  scenario "can see the user's recent 3 posts." do
    @user1 = User.create(Name: 'Titus', email: 'titus@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: "I'm a good person")
    @user2 = User.create(Name: 'Julie', email: 'julie@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: 'Software engineer')

    Post.create(Title: 'hello there', Text: 'Etiam et mauris et', user_id: @user2.id)
    Post.create(Title: 'ipsum dolor sit amet', Text: 'et mauris et ligula', user_id: @user2.id)
    Post.create(Title: 'sum dolor sit amet', Text: 'Etiam et et ligula', user_id: @user2.id)
    Post.create(Title: 'anything', Text: 'iam et et ligula', user_id: @user2.id)
    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user2.id)}']").click
    expect(page).to_not have_content 'hello there'
  end

  scenario "can see a button that lets me view all of a user's posts." do
    @user1 = User.create(Name: 'Titus', email: 'titus@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: "I'm a good person")
    @user2 = User.create(Name: 'Julie', email: 'julie@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: 'Software engineer')

    Post.create(Title: 'Lorem ipsum dolor', Text: 'Etiam et mauris et', user_id: @user2.id)
    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user2.id)}']").click
    expect(page.has_link?('See all Posts')).to be true
  end

  scenario "When I click a user's post, it redirects me to that post's show page.." do
    @user1 = User.create(Name: 'Titus', email: 'titus@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: "I'm a good person")
    @user2 = User.create(Name: 'Julie', email: 'julie@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: 'Software engineer')

    @post = Post.create(Title: 'Lorem ipsum dolor', Text: 'Etiam et mauris et', user_id: @user2.id)
    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user2.id)}']").click
    find("a[href='#{user_posts_path(@user2.id, @post.id)}']").click
    expect(page).to_not have_content 'Etiam et mauris et'
  end

  scenario "When I click to see all posts, it redirects me to the user's post's index page." do
    @user1 = User.create(Name: 'Titus', email: 'titus@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: "I'm a good person")
    @user2 = User.create(Name: 'Julie', email: 'julie@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', Bio: 'Software engineer')
    @post = Post.create(Title: 'Lorem ipsum dolor', Text: 'Etiam et mauris et', user_id: @user2.id)
    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user2.id)}']").click
    find("a[href='#{user_posts_path(@user2.id)}']").click
    expect(page.has_button?('Pagination')).to be true
  end
  # rubocop:enable Metrics/BlockLength
end