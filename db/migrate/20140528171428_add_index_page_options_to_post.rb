class AddIndexPageOptionsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :visible, :boolean, :default => true
    add_column :posts, :starred, :boolean, :default => false 
  end
end
