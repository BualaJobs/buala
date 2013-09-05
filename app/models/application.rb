#!/bin/env ruby
# encoding: utf-8
class Application < ActiveRecord::Base

  attr_accessor :accept_terms_and_conditions
  attr_accessible :degree, :email, :name, :university, :university_id, :advertisement, :advertisement_id, 
    :resume, :accept_terms_and_conditions

  belongs_to :university
  belongs_to :advertisement

  has_attached_file :resume, storage: :dropbox, :dropbox_credentials => Rails.root.join('config/dropbox.yml')

  validates :name, :university, :advertisement, :resume, :degree, presence: true
  validates_attachment :resume, presence: true, content_type: { content_type: ['application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'application/pdf'] },
    size: { in: 0..2048.kilobytes }
  validates :email, uniqueness: {scope: :advertisement_id}
  validates :email, email_format: { message: 'Email inválido' }
  validates_acceptance_of :accept_terms_and_conditions, accept: '1'

  def resume_url
    current_url = read_attribute(:resume_url)
    if !current_url || current_url.empty?
      current_url = update_dropbox_url
    end
    current_url
  end

  def update_dropbox_url
    requested_url = resume.url
    write_attribute(:resume_url, requested_url)
    self.save
    requested_url
  end

  def self.update_dropbox_urls
    Application.all.each do |application|
      application.update_dropbox_url
    end
  end

end
