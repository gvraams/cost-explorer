class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :amount

  def name
    object.title
  end
end
