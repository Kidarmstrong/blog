class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post, index: true
      t.string :author
      t.string :body
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
