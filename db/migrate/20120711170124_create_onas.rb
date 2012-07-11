class CreateOnas < ActiveRecord::Migration
  def change
    create_table :onas do |t|
      t.string :name
      t.string :info

      t.timestamps
    end
  end
end
