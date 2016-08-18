class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments  
  has_many :likes 
  #
  def already_liked?(post_id)
  	likes.where(post_id: post_id).empty?
  end		
end

