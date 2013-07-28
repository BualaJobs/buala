class UsersController < ApplicationController
  
  def show
  	@user = User.find(params[:id])
  	unless user_signed_in? && current_user.id == @user.id
		render status: :forbidden, text: 'Forbidden'
	end
  end
  
end
