#!/bin/env ruby
# encoding: utf-8
class UserMailer < ActionMailer::Base
  default from: "no-reply@bualajobs.com"

  def after_application_email(application)
  	@application = application
  	mail to: 'example@bualajobs.com', subject: 'Bualá! Jobs - Tu postulación se ha llevado a cabo con éxito'
  end

end
