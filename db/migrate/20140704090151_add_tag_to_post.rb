class AddTagToPost < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.belongs_to :tag
    end
  end
end
