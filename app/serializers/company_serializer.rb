class CompanySerializer < ActiveModel::Serializer
  attributes :id, :advertisements

  has_many :advertisements, serializer: AdvertisementShortSerializer

end
