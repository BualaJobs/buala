class UserSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :email, :university, :degree, :resume, :created_at

  def university
    object.university.name
  end
end
