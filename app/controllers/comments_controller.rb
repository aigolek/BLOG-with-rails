class CommentsController < ApplicationController
	before_action :authenticate_user!, only: :create
	load_and_authorize_resource
	def index
		#@post = Post.find_by(title: params[:post_title])
        #@comments = @post.comments #Comment.where(post_id: params[:post_id]) #find_by(post_id: params[:post_id])
        @comments = Comment.where(post_id: params[:post_id])   
    end
	def create
		#render text: params[:comment]
		#Comment.create(params[:comment]) #-- не пройдет по безопасности
		
		@comment = current_user.comments.new(comment_params)
		@comment.post_id = params[:post_id]
        
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
  def destroy
  	
  	@comment = Comment.find(params[:id])
  	#post_id = @comment.post_id
  	@comment.destroy #if current_user.id == @comment.user_id
    respond_to do |format|
      flash[:warning] ='Comment was successfully destroyed.'	
      format.html { #redirect_to post_url(post_id), notice: 'Comment was successfully destroyed.' }
      redirect_to :back }
      format.json { head :no_content }
    
    end

  end
	def comment_params
		params.require(:comment).permit(:text, :post_id)  #post_id - из за валидации
	end
	      
end	