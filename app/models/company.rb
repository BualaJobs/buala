class Company < ActiveRecord::Base
  
  before_save :generate_token

  attr_accessible :description, :location, :name, :website, :category, :category_id, :company_type, 
    :company_type_id, :company_logo, :admin_token

  belongs_to :category
  belongs_to :company_type
  has_many :advertisements

  mount_uploader :company_logo, CompanyLogoUploader

  validates :name, :description, :category, :company_type, presence: true

  acts_as_gmappable :check_process => false

  def gmaps4rails_address
    location
  end

  def generate_token
    self.admin_token = SecureRandom.urlsafe_base64(30, false)
  end

  def total_applications 
    acum = 0
    advertisements.each {|advertisement| acum += advertisement.applications.count }
    acum
  end

  def last_week_total_applications
    acum = 0
    advertisements.each {|advertisement| acum += advertisement.last_week_applications.count }
    acum
  end

  def top_universities n
    Application.joins(:advertisement).joins(:university)
      .where('company_id = ?', self.id)
      .select('university.*, count(*) as count_all')
      .group(:university)
      .order('count_all DESC')
      .limit(n)
      .count
  end

end
