class Company < ActiveRecord::Base
  extend FriendlyId
  
  attr_accessible :description, :location, :name, :website, :category, :category_id, :company_type, 
    :company_type_id, :company_logo
  belongs_to :category
  belongs_to :company_type

  mount_uploader :company_logo, CompanyLogoUploader

  validates :name, :description, :category, :company_type, :presence => true

  friendly_id :name, use: :slugged

end
