class Advertisement < ActiveRecord::Base
  attr_accessible :description, :title, :company, :company_id, :published, :category_1_id, :category_1
  belongs_to :company
  belongs_to :category_1, :class_name => 'Category'

  validates :title, :company, presence: true
  validates_length_of :title, :maximum => 45

end
