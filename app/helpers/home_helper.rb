module HomeHelper

  def get_link post, current_user
    if current_user.blank?
      html = link_to('Like' , login_path, class: 'btn btn-info btn-large', role: "button")
      return  html.html_safe      
    end
    if post.get_upvotes.find_by_voter_id(current_user.id).present?
      text = 'Dislike'
      is_liked = 0
    else
      text = 'Like'
      is_liked = 1
    end
    html = link_to(text , like_or_dislike_path(id: post.id, like: is_liked), method: :post, class: 'btn btn-info btn-large', role: "button", :remote => true)
    return html.html_safe
  end
end
