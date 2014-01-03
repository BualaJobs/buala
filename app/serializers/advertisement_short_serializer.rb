class AdvertisementShortSerializer < ActiveModel::Serializer
  attributes :id, :title, :applications_amount, :applications_data, :created_at

  def applications_amount
    object.postulations.count
  end

  def applications_data
    object.postulations_group_by_date
  end

end
