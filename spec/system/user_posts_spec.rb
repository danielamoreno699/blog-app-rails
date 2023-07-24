# spec/system/user_posts_spec.rb

require 'rails_helper'

RSpec.describe "User Posts", type: :system do
  

  it "displays the user's profile picture on user posts page" do
    user = User.create(name: "John Doe", photo: "https://images.unsplash.com/photo-1525134479668-1bee5c7c6845?ixlib=rb-4.0.3&amp;ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&amp;auto=format&amp;fit=crop&amp;w=687&amp;q=80", post_counter: 5)
    visit user_posts_path(user_id: user.id)

    # Check for the presence of the profile picture using XPath
    expect(page).to have_css("img[src='#{user.photo}']")
    #expect(page).to have_css(".img-user")
  end

  # Add more test scenarios as needed
end





