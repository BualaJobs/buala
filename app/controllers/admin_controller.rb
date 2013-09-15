class AdminController < ApplicationController

  layout "admin"

  before_filter :check_token

  protected
  def check_token
    unless params[:company_id]
      @company = Company.find(params[:id])
    else
      @company = Company.find(params[:company_id])
      if params[:id]
        @advertisement = Advertisement.find(params[:id])
      end
    end

    @token = params[:token]
    unless @token
      @token = cookies[:company_token]
    end

    unless @company && @token && @company.admin_token == @token
      render status: :forbidden, text: 'Invalid token'
    else 
      cookies[:company] = @company.id
      cookies[:company_token] = @token
    end

  end

end
