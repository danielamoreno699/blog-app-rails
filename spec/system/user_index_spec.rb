require 'rails_helper'

RSpec.describe 'User Index', type: :system do
  before do
    driven_by(:rack_test)
  end

  # Create test data for other users
  let!(:user1) { User.create(name: 'Alice', photo: 'https://example.com/alice.jpg', post_counter: 3) }
  let!(:user2) { User.create(name: 'Bob', photo: 'https://example.com/bob.jpg', post_counter: 5) }
  let!(:user3) { User.create(name: 'Eve', photo: 'https://example.com/eve.jpg', post_counter: 2) }

  it 'displays the username of all other users' do
    visit users_path

    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)
    expect(page).to have_content(user3.name)
  end

  it 'displays the profile picture for each user' do
    visit users_path

    expect(page).to have_css("img[src='#{user1.photo}']")
    expect(page).to have_css("img[src='#{user2.photo}']")
    expect(page).to have_css("img[src='#{user3.photo}']")
  end

  it 'displays the number of posts each user has written' do
    visit users_path

    expect(page).to have_content("Number of posts: #{user1.post_counter}")
    expect(page).to have_content("Number of posts: #{user2.post_counter}")
    expect(page).to have_content("Number of posts: #{user3.post_counter}")
  end

  it 'redirects to a user\'s show page when clicking on a user' do
    visit users_path

    click_link user1.name
    expect(page).to have_current_path(user_path(user1))
  end
end
