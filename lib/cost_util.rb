module CostUtil
  # Eagerly load cost_types to avoid n+1 queries
  def self.calculate_breakdown(costs_array = [])
    root_costs = costs_array.select { |cost| cost.cost_type.parent_id.nil? }
    breakdown = []

    root_costs.each do |root_cost|
      this_breakdown = self.get_cost_breakdown(costs_array, root_cost)
      breakdown.push(this_breakdown)
    end

    return breakdown
  end

  def self.get_client_breakdown(clients)
    return clients.map do |client|
      breakdown = []

      client.projects.each do |project|
        breakdown.push(self.get_project_breakdown(project))
      end

      {
        id: client.id,
        name: client.name,
        amount: client.amount,
        breakdown: breakdown,
      }
    end
  end

  def self.get_project_breakdown(project)
    costs = project.costs.includes(:cost_type)
    breakdown = self.calculate_breakdown(costs.to_a)

    {
      id: project.id,
      name: project.title,
      amount: project.amount,
      breakdown: breakdown,
    }
  end

  private

  def self.get_cost_breakdown(costs_array, cost)
    breakdown = []
    cost.cost_type.children.each do |child_cost_type|
      sub_costs = costs_array.select { |c| c.cost_type_id == child_cost_type.id }

      sub_costs.map do |sub_cost|
        breakdown.push(self.get_cost_breakdown(costs_array, sub_cost))
      end
    end

    return {
      id: cost.id,
      name: cost.cost_type.name,
      amount: cost.amount,
      breakdown: breakdown,
    }
  end
end
