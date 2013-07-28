class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render status: :not_found, text: 'Resource not found'
  end

end
