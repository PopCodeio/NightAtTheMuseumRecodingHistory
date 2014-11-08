class Item < ActiveRecord::Base
  serialize :params, JSON
  mount_uploader :picture, FileUploader
end
