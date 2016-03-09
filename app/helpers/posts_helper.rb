module PostsHelper
  def get_button current_user
    if current_user.present?
      btn = button_tag("Create", class: "btn btn-primary")
    else
       btn = link_to('Create' , login_path, class: 'btn btn-info btn-large', role: "button")
    end
    return btn.html_safe
  end

  def follow_user_link current_user, post
    if current_user.blank?
      html = link_to('Follow' , login_path, class: 'btn btn-info btn-large', role: "button")
      return  html.html_safe      
    end
    if current_user.following?(post).present?
      text = 'Unfollow'
      is_follow = 0
    else
      text = 'Follow'
      is_follow = 1
    end
    html = link_to(text , follow_or_unfollow_path(id:post.id , follow: is_follow), method: :post, class: 'btn btn-info btn-large', role: "button", :remote => true)
    return html.html_safe
  end
end
