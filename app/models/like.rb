class Like < ActiveRecord::Base
	belongs_to :user
	belongs_to :post
	validates :post_id, uniqueness: {scope: :user_id} # 1 user may like 1 post
	
end
