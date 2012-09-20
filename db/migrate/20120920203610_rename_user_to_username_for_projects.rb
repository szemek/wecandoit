class RenameUserToUsernameForProjects < ActiveRecord::Migration
  def up
    rename_column :projects, :user, :username
  end

  def down
    rename_column :projects, :username, :user
  end
end
