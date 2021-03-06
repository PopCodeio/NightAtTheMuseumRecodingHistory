class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :item_id
      t.text    :comment

      t.boolean :deleted, default: false
      t.integer :deleted_by
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
