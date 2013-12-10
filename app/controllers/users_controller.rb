class UsersController < ApplicationController
  
  before_filter :authenticate_user!, only: [:me, :edit_password]
  before_filter :set_user, except: [:show]

  layout 'profile_layout', only: [:me, :edit_password, :update]

  def show
    unless user_signed_in? && current_user.id == params[:id].to_i
      render status: :forbidden, text: 'Forbidden'
    end
  end

  def update
    @user = current_user
    @user.attributes = params[:user]
    if @user.save
      flash.now[:success] = I18n.t 'buala.users.profile.saved_successfully'
    end
    if params[:previous_url]
      redirect_to params[:previous_url]
    else
      render 'users/me' 
    end
  end

  def me
    @user = current_user
    @previous_url = params[:pu] if params[:pu]
  end

  def set_user
    @user = current_user
  end

end
