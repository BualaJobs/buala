class Advertisement < ActiveRecord::Base
  attr_accessible :description, :title, :company, :company_id, :published, :category_1_id, :category_1, 
  	:category_2_id, :category_2, :advertisement_type, :advertisement_type_id

  belongs_to :company
  belongs_to :category_1, :class_name => 'Category'
  belongs_to :category_2, :class_name => 'Category'
  belongs_to :advertisement_type

  validates :title, :company, :category_1, :advertisement_type, presence: true
  validates_length_of :title, :maximum => 45
  validate :different_categories

  private
  def different_categories
    if category_1 && category_2 && category_1 == category_2
      errors.add :category_2, 'Categories should be different'
    end
  end

end
