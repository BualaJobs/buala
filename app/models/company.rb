class Company < ActiveRecord::Base
  
  before_save :generate_token

  attr_accessible :description, :location, :name, :website, :category, :category_id, :company_type, 
    :company_type_id, :company_logo, :admin_token, :email

  belongs_to :category
  belongs_to :company_type
  has_many :advertisements

  mount_uploader :company_logo, CompanyLogoUploader

  validates :name, :description, :category, :company_type, :email, presence: true
  validates_email_format_of :email

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

  def total_postulations
    acum = 0
    advertisements.each {|advertisement| acum += advertisement.postulants.count }
    acum
  end

  def last_week_total_applications
    acum = 0
    advertisements.each {|advertisement| acum += advertisement.last_week_applications.count }
    acum
  end

  def last_week_total_postulations
    acum = 0
    advertisements.each {|advertisement| acum += advertisement.last_week_postulations.count }
    acum
  end

  def top_universities n
    Postulation
    .joins('INNER JOIN advertisements ON advertisements.id = postulations.advertisement_id')
    .joins('INNER JOIN users ON users.id = postulations.user_id')
    .joins('INNER JOIN universities ON users.university_id = universities.id')
    .where('advertisements.company_id = ?', self.id)
    .group('universities.name')
    .order('count_all DESC')
    .limit(n)
    .count
  end

end
