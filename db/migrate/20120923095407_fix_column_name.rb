class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :guides, :seo_url, :slug
    add_index :guides, :slug, unique: true
  end

  def down
    rename_column :guides, :slug, :seo_url
  end
end
