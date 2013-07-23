class Advertisement < ActiveRecord::Base
  validates :title, :company, presence: true

  attr_accessible :description, :title, :company_id, :published

  belongs_to :company
end
