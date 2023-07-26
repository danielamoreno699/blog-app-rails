module UsersHelper
  def render_text_user_section(_user, post)
    content_tag(:div, class: 'text') do
      concat content_tag(:p, "Comments: #{post.CommentsCounter.nil? ? 0 : post.CommentsCounter}",
                         class: 'comment-text')
      concat content_tag(:p, "Likes: #{post.LikesCounter.nil? ? 0 : post.LikesCounter}")
    end
  end

  def render_flash_messages
    if flash[:success]
      content_tag(:div, flash[:success], class: 'flash-success')
    elsif flash[:alert]
      content_tag(:div, flash[:alert], class: 'flash-alert')
    end
  end

  def user_photo_tag(user)
    if user.photo.present?
      image_tag(user.photo, class: 'img-user')
    end
  end
end
