class University < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true
  validates_uniqueness_of :name


  def self.ordered
  	collection = University.where('name != ?', 'Otra').order('name ASC')
  	other = University.where(name: 'Otra')
  	collection + other
  end

end
