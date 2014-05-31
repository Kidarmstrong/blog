class AddIndexPageOptionsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :main_article, :boolean, :default => false
    add_column :posts, :show_on_main_page, :boolean, :default => true
  end
end
