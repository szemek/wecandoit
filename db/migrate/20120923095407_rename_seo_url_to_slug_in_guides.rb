class RenameSeoUrlToSlugInGuides < ActiveRecord::Migration
  def up
    rename_column :guides, :seo_url, :slug
    add_index :guides, :slug, unique: true
  end

  def down
    remove_index :guides, :slug
    rename_column :guides, :slug, :seo_url
  end
end
