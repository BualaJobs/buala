class UsersController < ApplicationController
  
  def show
  	unless user_signed_in? && current_user.id == params[:id].to_i
		render status: :forbidden, text: 'Forbidden'
	end
  	@user = User.find(params[:id])
  end
end
