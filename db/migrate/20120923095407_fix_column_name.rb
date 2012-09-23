class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :guides, :seo_url, :slug
    add_index :guides, :slug, unique: true
  end

  def down
    add_index :guides, :slug, unique: false
    rename_column :guides, :slug, :seo_url
  end
end
