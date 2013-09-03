class Advertisement < ActiveRecord::Base
  extend FriendlyId

  attr_accessible :description, :title, :company, :company_id, :published, :category_1_id, :category_1, 
  	:category_2_id, :category_2, :advertisement_type, :advertisement_type_id, :is_paid,
    :working_turn, :working_turn_id, :start_date, :vacancies, :requirements, :short_description, 
    :recommendable

  belongs_to :company
  belongs_to :category_1, :class_name => 'Category'
  belongs_to :category_2, :class_name => 'Category'
  belongs_to :advertisement_type
  belongs_to :working_turn
  has_many :applications, order: 'created_at DESC'

  validates :title, :company, :category_1, :advertisement_type, :description, 
    :working_turn, :short_description, presence: true
  validates_length_of :title, :maximum => 45
  validate :different_categories
  validates :vacancies, numericality: { greater_than_or_equal_to: 0 }
  validates_length_of :short_description, :maximum => 250
  validate :if_is_recommendable_it_should_be_published

  scope :published, -> { where(published: true) }

  scope :published_random_order, -> { where(published: true).order('random()')}

  friendly_id :title, use: :slugged

  def recommended
    Advertisement.published.where("id != ?", id).where(recommendable: true).sample(3)
  end

  private
  def different_categories
    if category_1 && category_2 && category_1 == category_2
      errors.add :category_2, 'Categories should be different'
    end
  end

  private
  def if_is_recommendable_it_should_be_published
    if recommendable && !published
      errors.add :recommendable, 'To be a recommendable advertisement, first it should be published'
    end
  end

end
