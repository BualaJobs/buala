#!/bin/env ruby
# encoding: utf-8
class HomeController < ApplicationController
  
  def index
  	@advertisements = Advertisement.published_random_order
  end

end
