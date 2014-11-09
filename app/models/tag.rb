class Tag < ActiveRecord::Base

  has_many :user_tags
  has_many :users, through: :user_tags
  has_many :items, through: :user_tags
end
