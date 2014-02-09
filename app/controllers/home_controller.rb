#!/bin/env ruby
# encoding: utf-8
class HomeController < ApplicationController
  
  def index
  	@advertisements = Advertisement.published_order_by_creation
  end

  def business
  end

end
