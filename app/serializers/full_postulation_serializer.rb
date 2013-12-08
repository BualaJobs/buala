class FullPostulationSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :email, :resume, :seen, :created_at, :university, :degree

  def id
    object.user_id
  end

  def university
    object.university.name
  end

  def seen
    object.seen == "t"
  end

  def resume
    url_for controller: 'V1/postulations', action: 'resume', id: object.id
  end

end
