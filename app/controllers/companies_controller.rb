class CompaniesController < ApplicationController

  before_filter :check_token

  def show
  end

  private
  def check_token
    @company = Company.find(params[:id])
    unless @company && params[:token] && @company.admin_token == params[:token]
      render status: :forbidden, text: 'Invalid token'
    end
  end

end
