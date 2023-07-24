require 'rails_helper'

RSpec.describe 'Post Show', type: :system do
  before do
    driven_by(:rack_test)
  end

  user = User.create(name: 'John Doe',
                     photo: 'https://images.unsplash.com/photo-1525134479668-1bee5c7c6845?ixlib=rb-4.0.3&amp;ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&amp;auto=format&amp;fit=crop&amp;w=687&amp;q=80', post_counter: 5)
  post = Post.create(Title: 'My First Post', Text: 'This is my first post', author_id: user.id, CommentsCounter: 0,
                     LikesCounter: 0)
  comment = Comment.create(Text: 'This is my first comment', author_id: user.id, post_id: post.id)

  it 'displays posts title' do
    visit user_post_path(user_id: user.id, id: post.id)
    expect(page).to have_content(post.Title)
  end

  it 'displays who wrote the post' do
    visit user_post_path(user_id: user.id, id: post.id)
    expect(page).to have_content(user.name)
  end

  it 'displays how many comments the post has' do
    visit user_post_path(user_id: user.id, id: post.id)
    expect(page).to have_content(post.CommentsCounter)
  end

  it 'displays how many likes the post has' do
    visit user_post_path(user_id: user.id, id: post.id)
    expect(page).to have_content(post.LikesCounter)
  end

  it 'displays the post text' do
    visit user_post_path(user_id: user.id, id: post.id)
    expect(page).to have_content(post.Text)
  end

  it 'displays the user name commentor' do
    visit user_post_path(user_id: user.id, id: post.id)
    expect(page).to have_content(comment.user.name)
  end

  it 'displays the comment text' do
    visit user_post_path(user_id: user.id, id: post.id)
    expect(page).to have_content(comment.Text)
  end
end
