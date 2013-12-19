class UsersController < ApplicationController
  
  before_filter :authenticate_user!, only: [:me, :edit_password]
  before_filter :set_user, except: [:show]

  before_filter :check_migration_token, only: [:migrate, :define_password]

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

  def test_migration_email
    UserMailer::migration_email(User.find(37)).deliver
    render nothing: true
  end

  def migrate
  end

  def define_password
    if @user.update_attributes(params[:user])
      sign_in @user, bypass: true
      flash[:notice] = 'Tu cuenta se activado correctamente!'
      redirect_to root_url
    elsif @user.errors[:password].empty?
      @user.attributes = params[:user]
      @user.save(validate: false)
    else
      render :migrate
    end
  end

  def check_migration_token
    @user = User.find(params[:id])
    unless @user and @user.check_migration_token params[:token]
      render status: :forbidden, text: 'Invalid token provided'
    end
  end

end
