class ApplicationSerializer < ActiveModel::Serializer
  attributes :id, :name, :university, :degree, :seen, :resume_url, :created_at, :email

  def university
  	object.university.name
  end
end
