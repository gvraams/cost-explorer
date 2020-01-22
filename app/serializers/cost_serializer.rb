class CostSerializer < ActiveModel::Serializer
  attributes :id, :name, :amount

  def name
    object.cost_type.name
  end
end
