class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.boolean :deleted, default: false
      t.integer :deleted_by
      t.datetime :deleted_att, default: false
      t.timestamps
    end
  end
end
