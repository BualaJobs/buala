#!/bin/env ruby
# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_default_tags
  before_filter :set_spanish_language

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render status: :not_found, text: 'Resource not found'
  end

  def set_admin_locale
    puts "Setting admin language!"
    I18n.locale = :en
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

  def store_location
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  def set_spanish_language
    I18n.locale = 'es'
  end

end
