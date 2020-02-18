class CostTypeSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_one :parent, embed: true, :include => true
end
