class AddSeoUrlToGuides < ActiveRecord::Migration
  def change
    add_column :guides, :seo_url, :string
  end
end
