module PostsHelper
  def render_text_section(post)
    content_tag(:div, class: 'text') do
      concat content_tag(:p, "Comments: #{post.CommentsCounter.nil? ? 0 : post.CommentsCounter}", class: 'comment-text')
      concat link_to 'Like', increment_likes_path(post), method: :post, remote: true do
        content_tag(:p, "Likes: #{post.LikesCounter.nil? ? 0 : post.LikesCounter}", class: 'like-counter')
      end
    end
  end
  

  def render_comments_section(post)
    content_tag(:ul, class: 'ul-comments-box') do
      concat content_tag(:h4, 'Section for Comments:', class: 'section-comments')

      if post.comments.blank?
        concat content_tag(:li, 'no comments for the moment')
      else
        post.recent_comments.each do |comment|
          concat content_tag(:li, "Username: #{comment.Text.blank? ? 'no comments for the moment' : comment.Text}")
        end
      end
    end
  end

  def render_flash_messages
    if flash[:success]
      content_tag(:div, flash[:success], class: 'flash-success')
    elsif flash[:alert]
      content_tag(:div, flash[:alert], class: 'flash-alert')
    end
  end
end
