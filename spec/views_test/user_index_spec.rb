require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.feature 'Logins', type: :feature do
  background { visit new_user_session_path }
  scenario 'Page should have userName of other users' do
    @user1 = User.create(Name: 'Titus', email: 'titus@gmail.com', password: 'qwerty', confirmed_at: Time.now)
    @user2 = User.create(Name: 'Julie', email: 'julie@gmail.com', password: 'qwerty', confirmed_at: Time.now)
    @user3 = User.create(Name: 'Manny', email: 'manny@gmail.com', password: 'qwerty', confirmed_at: Time.now)
    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Titus'
    expect(page).to have_content 'Julie'
    expect(page).to have_content 'Manny'
  end

  scenario 'Page should have profile photo for each user' do
    @user1 = User.create(Name: 'Titus', email: 'titus@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg')
    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
    expect(find('img') do |img|
             img[:src] == 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg'
           end).to be_truthy
  end

  scenario 'Should see number of post for each user' do
    @user1 = User.create(Name: 'Titus', email: 'titus@gmail.com', password: 'qwerty', confirmed_at: Time.now)
    @user2 = User.create(Name: 'Julie', email: 'julie@gmail.com', password: 'qwerty', confirmed_at: Time.now)

    Post.create(Title: 'Lorem ipsum dolor sit amet', Text: 'Etiam et mauris et ligula', user_id: @user2.id)
    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
    expect(page).to have_content "Number of posts: #{@user2.posts.size}"
  end

  scenario "When click on user Should redirected to that user's show page" do
    @user1 = User.create(Name: 'Titus', email: 'titus@gmail.com', password: 'qwerty', confirmed_at: Time.now)
    @user2 = User.create(Name: 'Julie', email: 'julie@gmail.com', password: 'qwerty', confirmed_at: Time.now)

    Post.create(Title: 'Lorem ipsum dolor sit amet', Text: 'Etiam et mauris et ligula', user_id: @user2.id)
    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user2.id)}']").click
    expect(page).to have_content 'Julie'
  end
  # rubocop:enable Metrics/BlockLength
end