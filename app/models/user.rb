class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  attr_accessible :email, :fullname, :password, :password_confirmation, 
    :remember_me, :university, :university_id, :degree, :resume, :migrated,
    :migration_token

  belongs_to :university

  has_attached_file :resume, Buala::Application.config.buala.resume_storage

  has_many :postulations

  validates_attachment :resume, 
    content_type: { 
      content_type: [
        'application/msword', 
        'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 
        'application/pdf'
      ]
    },
    size: { in: 0..2048.kilobytes }

  validates :fullname, presence: true, length: {maximum: 25}
  validates :degree, length: {maximum: 100}

  def ready_for_application
    !(self.degree.blank? or self.university.blank? or self.resume.blank?)
  end

  def has_applied advertisement
    !!self.postulations.where(advertisement_id: advertisement.id).first
  end

  def check_migration_token token
    self.migration_token == token
  end

end
