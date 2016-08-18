class LikesController < ApplicationController
	def create

		#not_liked = current_user.likes.where(post_id: params[:post_id]).empty?
		#if not_liked
		@like = current_user.likes.create(post_id: params[:post_id])		
		#end
		redirect_to post_path(params[:post_id])
	end	
	def destroy
		@like = current_user.likes.where(post_id: params[:post_id])	
		@like.destroy_all	
		redirect_to post_path(params[:post_id])
	end
end	