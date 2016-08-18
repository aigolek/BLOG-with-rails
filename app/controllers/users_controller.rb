class UsersController < ApplicationController
	def show
		#для порсмотра профайлов пользователей
		@user = User.find(params[:id])
	end
end	