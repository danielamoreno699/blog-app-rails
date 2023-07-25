require 'rails_helper'

RSpec.describe 'User Show Page', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) do
    User.create(
      name: 'John Doe',
      photo: 'https://images.unsplash.com/photo-1525134479668-1bee5c7c6845?ixlib=rb-4.0.3&amp;ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&amp;auto=format&amp;fit=crop&amp;w=687&amp;q=80',
      post_counter: 5
    )
  end

  let(:post) do
    Post.create(
      Title: 'My First Post',
      Text: 'This is my first post',
      user:,
      CommentsCounter: 0,
      LikesCounter: 0
    )
  end

  before do
    user
    post
    visit user_path(user)
  end

  context 'User profile section' do
    it 'shows the user profile picture' do
      profile_picture = find('.img-user')

      expect(profile_picture).to be_visible
      expect(profile_picture['src']).to eq user.photo
    end

    it 'shows the user\'s name' do
      expect(page).to have_content(user.name)
    end

    it 'shows the number of posts the user has written' do
      expect(page).to have_content("User Posts: #{user.post_counter}")
    end

    it 'shows the user bio' do
      expect(page).to have_content(user.bio)
    end
  end

  context 'User posts section' do
    it 'shows the user\'s first 3 posts' do
      expect(page).to have_content(post.Title)
    end

    it 'shows a button that allows me to view all of the user\'s posts when clicked' do
      expect(page).to have_link('See all Posts', href: user_posts_path(user))
    end

    it 'redirects to the user\'s post index page when the \'See all Posts\' button is clicked' do
      click_link 'See all Posts'

      expect(page).to have_current_path(user_posts_path(user))
    end
  end
end
