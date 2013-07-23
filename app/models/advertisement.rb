class Advertisement < ActiveRecord::Base
  validates :title, :company, presence: true
  validates_length_of :title, :maximum => 45

  attr_accessible :description, :title, :company_id, :published

  belongs_to :company
end
