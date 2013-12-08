class Postulation < ActiveRecord::Base
  attr_accessible :advertisement, :user, :seen

  belongs_to :advertisement
  belongs_to :user

  validates_uniqueness_of :advertisement_id, scope: :user_id

  def self.full_postulants advertisement
    User.joins(:postulations).where('postulations.advertisement_id = ?', advertisement.id).select("*")
  end

end
