module PostsHelper
  def render_text_section(post)
    content_tag(:div, class: 'text') do
      concat content_tag(:p, "Comments: #{post.CommentsCounter.nil? ? 0 : post.CommentsCounter}", class: 'comment-text')
      concat link_to 'Likes: ', increment_likes_path(post), method: :post, remote: true, class: 'like-counter',
                                                            id: "like-link-#{post.id}"
      concat content_tag(:span, post.LikesCounter.nil? ? 0 : post.LikesCounter, class: 'like-counter-number',
                                                                                id: "like-counter-#{post.id}")
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
