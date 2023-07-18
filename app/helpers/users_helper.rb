module UsersHelper
    def render_user_posts(user)
      posts_html = ""
      user.posts.each do |post|
        posts_html += content_tag(:div, class: "post") do
          post_title = link_to post.Title, user_posts_path(user_id: user.id), class: "custom-link-s"
          post_content = content_tag(:p, post.Text, class: "post-text")
          text_div = content_tag(:div, class: "text") do
            comment_counter = content_tag(:p, "Comments: #{post.CommentsCounter.nil? ? 0 : post.CommentsCounter}", class: "comment-text")
            likes_counter = content_tag(:p, "Likes: #{post.LikesCounter.nil? ? 0 : post.LikesCounter}", class: "likes-text")
            comment_counter + likes_counter
          end
          post_title + post_content + text_div
        end
      end
      posts_html.html_safe
    end
  end
  
