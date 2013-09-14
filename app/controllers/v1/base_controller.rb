class V1::BaseController < ApplicationController

  before_filter :authenticate

  respond_to :json

  protected 

  def authenticate
    company_id = cookies[:company]
    token = cookies[:company_token]

    @company = Company.find(company_id)

    unless @company.admin_token == token
      render status: :forbidden, nothing: true
    end

  end

end
