class Postulation < ActiveRecord::Base
  attr_accessible :advertisement, :user

  belongs_to :advertisement
  belongs_to :user

  validates_uniqueness_of :advertisement_id, scope: :user_id

end
