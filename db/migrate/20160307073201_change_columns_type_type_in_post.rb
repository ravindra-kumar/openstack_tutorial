class ChangeColumnsTypeTypeInPost < ActiveRecord::Migration
  def up
    change_column :posts, :post_message, :text
  end

  def down
    # This might cause trouble if you have strings longer
    # than 255 characters.
    change_column :posts, :post_message, :string
  end
end
