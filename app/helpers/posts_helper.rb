module PostsHelper
  def get_button current_user
    if current_user.present?
      btn = button_tag("Create", class: "btn btn-primary")
    else
       btn = link_to('Create' , login_path, class: 'btn btn-info btn-large', role: "button")
    end
    return btn.html_safe
  end
end
