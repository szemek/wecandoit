class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :user
      t.string :repo

      t.timestamps
    end
  end
end
