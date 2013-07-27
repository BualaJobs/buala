class Degree < ActiveRecord::Base
  attr_accessible :name, :university

  belongs_to :university

  validates :name, :university, presence: true
  validates_uniqueness_of :name

end
