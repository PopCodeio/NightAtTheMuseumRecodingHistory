class User < ActiveRecord::Base
  has_merit
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_tags
  has_many :tags, through: :user_tags
  has_many :items, through: :user_tags
  has_many :comments
end
