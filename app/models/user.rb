class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  attr_accessible :email, :fullname, :password, :password_confirmation, 
  	:remember_me, :university, :university_id, :degree, :resume

  belongs_to :university

  has_attached_file :resume, Buala::Application.config.buala.s3_resume_storage

  validates :fullname, presence: true

end
