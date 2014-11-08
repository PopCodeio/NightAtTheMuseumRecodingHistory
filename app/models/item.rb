class Item < ActiveRecord::Base
  has_many :user_tags
  has_many :tags, through: :user_tags
  has_many :users, through: :user_tags

  serialize :params, JSON
  mount_uploader :picture, FileUploader
end
