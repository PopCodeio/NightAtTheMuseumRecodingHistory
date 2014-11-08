class CreateItem < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer  :source_db_id, null: false, default: ""
      t.string   :title, null: false, default: ""
      t.string   :date, null: false, default: ""
      t.date     :source_date
      t.string   :description, null: false, default: ""
      t.string   :source_id, null: false, default: ""
      t.string   :source, null: false, default: ""
      t.string   :found, null: false, default: ""
      t.string   :creator, null: false, default: ""
      t.string   :subject, null: false, default: ""
      t.string   :rights, null: false, default: ""
      t.string   :picture, null: false, default: ""
      t.datetime :time_line_date
      t.text     :params
      t.timestamps
    end
  end
end
