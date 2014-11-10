class CreateItem < ActiveRecord::Migration
  def change
    create_table  :items do |t|
      # History Of Miami
      # params id
      t.integer :source_db_id, null: false, default: ""
      # History Of Miami
      # asset id
      t.string :source_id, null: false, default: ""
      # History Of Miami
      # asset date
      t.string :date, null: false, default: ""
      # History Of Miami
      # asset title
      t.text :title, null: false, default: ""
      # History Of Miami
      # asset description
      t.text :description, null: false, default: ""
      # History Of Miami
      # assets repository
      t.text :source, null: false, default: ""
      # History Of Miami
      # assets categories
      t.text :found, null: false, default: ""
      # History Of Miami
      # assets creator
      t.text :creator, null: false, default: ""
      # History Of Miami
      # assets subject
      t.text :subject, null: false, default: ""
      # History Of Miami
      # assets rights
      t.text :rights, null: false, default: ""
      # History Of Miami
      # assets image
      t.string :picture, null: false, default: ""

      t.datetime :time_line_date
      t.text     :params
      t.timestamps
    end
  end
end
