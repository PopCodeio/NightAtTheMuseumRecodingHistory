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

  attr_accessor :updating_password
  mount_uploader :photo, FileUploader

  def name
    full_name
  end

  def full_name
    (self.first_name + ' ' + self.last_name).titleize
  end

  def should_validate_password?
    updating_password || new_record?
  end
end
