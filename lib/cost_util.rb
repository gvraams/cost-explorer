module CostUtil
  def self.get_clients_breakdown(clients, projects)
    client_ids = projects.pluck(:client_id)
    project_ids = projects.pluck(:id)

    return clients.map do |client|
      next unless client_ids.include?(client.id)
      breakdown = []

      client.projects.each do |project|
        next unless project_ids.include?(project.id)
        breakdown.push(self.get_project_breakdown(project))
      end

      {
        id: client.id,
        name: client.name,
        amount: client.amount,
        breakdown: breakdown,
      }
    end.compact
  end

  def self.get_project_breakdown(project)
    costs = project.costs.includes(:cost_type)
    breakdown = self.calculate_breakdown(costs)

    return {
      id: project.id,
      name: project.title,
      amount: project.amount,
      breakdown: breakdown,
    }
  end

  def self.get_cost_breakdown(costs, cost)
    breakdown = []

    cost.cost_type.children.each do |child_cost_type|
      sub_costs = costs.select { |c| c.cost_type_id == child_cost_type.id }
      sub_costs.map do |sub_cost|
        breakdown.push(self.get_cost_breakdown(costs, sub_cost))
      end
    end

    return {
      id: cost.id,
      name: cost.cost_type.name,
      amount: cost.amount,
      breakdown: breakdown,
    }
  end

  private

  def self.calculate_breakdown(costs)
    root_costs = costs.select { |cost| cost.cost_type.parent_id.nil? }
    breakdown = []

    root_costs.each do |root_cost|
      this_breakdown = self.get_cost_breakdown(costs, root_cost)
      breakdown.push(this_breakdown)
    end

    return breakdown
  end
end
