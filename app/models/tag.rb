class Tag < ActiveRecord::Base
  has_many :user_tags
  has_many :users, through: :user_tags
  has_many :items, through: :user_tags
  before_validation { |tag| tag.name = name.downcase}

  def tag_count(options ={})
    self.user_tags.where(item_id: options[:item]).count
  end
end
