#!/bin/env ruby
# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_default_tags

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render status: :not_found, text: 'Resource not found'
  end

  private
  def set_default_tags

    title = "Bualá Jobs"
    description = "El primer sitio laboral 
      pensado por y para estudiantes donde podes encontrar más ofertas y conocer 
      las empresas antes de aplicar."

    set_meta_tags title: title, description: description

    set_meta_tags :og => {
      title: title,
      description: description,
      url: root_url,
      image: "#{root_url}images/buala_box.png"
    }

  end

end
