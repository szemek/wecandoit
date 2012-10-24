class AddPostIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :post_id, :integer
  end
end
