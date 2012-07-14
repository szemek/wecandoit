class RecreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :username
      t.string :avatar_url
      t.string :provider
      t.string :access_token

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
