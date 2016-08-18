class Post < ActiveRecord::Base
	validates :content, presence: true
	validates :title, presence: true
	has_many :comments, dependent: :destroy
	belongs_to :user
	has_many :likes, dependent: :destroy

	def likers
		names = likes.collect {|like| like.user.name} 
		names.join(', ')
	end	
end
