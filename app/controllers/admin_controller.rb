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
    unless @company && params[:token] && @company.admin_token == params[:token]
      render status: :forbidden, text: 'Invalid token'
    end
  end

end
