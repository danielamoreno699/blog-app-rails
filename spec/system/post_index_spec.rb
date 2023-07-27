require 'rails_helper'

RSpec.describe 'Post Index', type: :system do
  before do
    driven_by(:rack_test)
  end

  let!(:user) { User.create(name: 'Alice', photo: 'https://example.com/alice.jpg', post_counter: 3) }

  let!(:post1) do
    Post.create(Title: 'My First Post', Text: 'This is my first post', author_id: user.id, CommentsCounter: 0,
                LikesCounter: 0)
  end

  let!(:comment1) { Comment.create(Text: 'This is my first comment', author_id: user.id, post_id: post1.id) }

  it "displays the user's profile picture on user posts page" do
    visit user_posts_path(user_id: user.id)

    expect(page).to have_css("img[src='#{user.photo}']")
  end

  it "displays the user's name on user posts page" do
    visit user_posts_path(user_id: user.id)

    expect(page).to have_content(user.name)
  end

  it 'displays users post count on user post page' do
    user = User.create(name: 'Alice', photo: 'https://example.com/alice.jpg', post_counter: 3)
    visit user_posts_path(user_id: user.id)
    expect(page).to have_content(user.post_counter)
  end

  it 'displays a post title on user posts page' do
    visit user_posts_path(user_id: user.id)

    expect(page).to have_content(post1.Title)
  end

  it 'displays a post text on user posts page' do
    visit user_posts_path(user_id: user.id)

    expect(page).to have_content(post1.Text)
  end

  it 'displays the first comments on a post' do
    visit user_posts_path(user_id: user.id)

    expect(page).to have_content(comment1.Text)
  end

  it 'displays the number of comments on a post' do
    visit user_posts_path(user_id: user.id)

    expect(page).to have_content(post1.CommentsCounter)
  end

  it 'displays the number of likes on a post' do
    visit user_posts_path(user_id: user.id)

    expect(page).to have_content(post1.LikesCounter)
  end

  it 'redirects to post show page when clicking on post title' do
    visit user_posts_path(user_id: user.id)
    click_link post1.Title
    expect(page).to have_current_path(user_post_path(user_id: user.id, id: post1.id))
  end
end
