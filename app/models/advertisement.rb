class Advertisement < ActiveRecord::Base
  validates :title, :company, presence: true

  attr_accessible :description, :title, :company_id

  belongs_to :company
end
