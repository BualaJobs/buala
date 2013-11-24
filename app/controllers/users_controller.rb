class UsersController < ApplicationController
  
  before_filter :authenticate_user!, only: [:me]

  def show
    unless user_signed_in? && current_user.id == params[:id].to_i
        render status: :forbidden, text: 'Forbidden'
    end
  end

  def me
    @user = current_user
  end

end
