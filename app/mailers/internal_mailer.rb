#!/bin/env ruby
# encoding: utf-8
class InternalMailer < ActionMailer::Base
  default from: "no-reply@bualajobs.com"

  def company_contact(contact)
    @contact = contact
    mail to: Buala::Application.config.buala.business_contact_email, subject: 'Bualá - Contacto de empresa'
  end

end
