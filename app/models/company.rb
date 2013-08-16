class Company < ActiveRecord::Base
  
  attr_accessible :description, :location, :name, :website, :category, :category_id, :company_type, 
    :company_type_id, :company_logo
  belongs_to :category
  belongs_to :company_type

  mount_uploader :company_logo, CompanyLogoUploader

  validates :name, :description, :category, :company_type, :presence => true

  acts_as_gmappable

  def gmaps4rails_address
    location 
  end

end
