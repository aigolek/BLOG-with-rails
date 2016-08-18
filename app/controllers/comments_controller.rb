class CommentsController < ApplicationController
	before_action :authenticate_user!, only: :create
	def create
		#render text: params[:comment]
		#Comment.create(params[:comment]) #-- не пройдет по безопасности
		@comment = current_user.comments.new(comment_params)
        
		if @comment.save

			redirect_to post_path(@comment.post_id),notice: "Your comment was saved!"
		else 
			session[:comment] = @comment.text
			redirect_to post_path(@comment.post_id),notice: "Could not save!"
			#@post = Post.find(@comment.post_id)
			#@comments = @post.comments
			#@likes = @post.likes
			#render 'posts/show'
		end	
	end	
	def comment_params
		params.require(:comment).permit(:text, :post_id)  #post_id - из за валидации
	end
	      
end	