class Advertisement < ActiveRecord::Base

  attr_accessible :description, :title, :company_id, :published
  belongs_to :company

  validates :title, :company, presence: true
  validates_length_of :title, :maximum => 45

end
