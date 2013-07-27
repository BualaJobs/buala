class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  attr_accessible :email, :name, :password, :password_confirmation, :remember_me, :university_id, :degree_id

  belongs_to :university
  belongs_to :degree

  validates :university, :degree, :name, presence: true
end
