class Comment < ActiveRecord::Base
	validates :text, presence: true, length: {minimum: 10}
	validates :post_id, presence: true
	validates :user_id, presence: true
	belongs_to :post
	belongs_to :user
end
