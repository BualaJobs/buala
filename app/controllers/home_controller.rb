#!/bin/env ruby
# encoding: utf-8
class HomeController < ApplicationController
  
  def index
  	@advertisements = Advertisement.published_order_by_creation
  end

  def business
  end

  def business_contact
    if params[:name] && params[:email]
      InternalMailer.company_contact({name: params[:name], company: params[:company], email: params[:email]})
      render status: :ok, nothing: true
    else
      render status: :bad_request, nothing: true
    end
  end

end
