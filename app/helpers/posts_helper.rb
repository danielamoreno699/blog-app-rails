module PostsHelper
end
module PostsHelper
    def render_comments_section(post)
      content_tag(:ul, class: 'ul-comments-box') do
        concat content_tag(:h4, 'Section for Comments:', class: 'section-comments')
        
        if post.comments.blank?
          concat content_tag(:li, 'no comments for the moment')
        else
          post.comments.each do |comment|
            concat content_tag(:li, "Username: #{comment.Text.blank? ? 'no comments for the moment' : comment.Text}")
          end
        end
      end
    end
  end
  