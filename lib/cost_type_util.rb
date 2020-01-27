module CostTypeUtil
  def self.get_cost_types_with_descendants(parent_types)
    result = []
    parent_types.map { |type| self.get_cost_type_with_descendants(type, result) }
    result
  end

  def self.get_cost_type_with_descendants(type, result = [])
    result.push(type)
    type.children.each { |child| self.get_cost_type_with_descendants(child, result) }
    result
  end
end
