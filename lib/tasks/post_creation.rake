namespace :post_creation do
  desc "User and post create"
  task default_posts: :environment do
    user_params = {"name"=>"ravendra", "email"=>"ravendra512@gmail.com", "password"=>"123456", "password_confirmation"=>"123456"}
    @user = User.new(user_params)
    @user.toggle :activated
    @user.save
    for i in 1..12
      Post.create post_message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", user_id: @user.id, title: "Dummy post #{i}"
    end
  end
end
