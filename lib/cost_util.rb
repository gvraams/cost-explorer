module CostUtil
  def self.get_clients_info(clients, projects, costs)
    return clients.map do |client|
      breakdown = []

      projects.where(client_id: client.id).each do |project|
        project_costs = costs.where(project_id: project.id)
        project_breakdown = self.get_project_info(project, project_costs)
        breakdown.push(project_breakdown)
      end

      {
        id: client.id,
        name: client.name,
        amount: client.amount,
        breakdown: breakdown,
      }
    end.compact
  end

  def self.get_project_info(project, costs)
    {
      id: project.id,
      name: project.title,
      amount: project.amount,
      breakdown: self.project_breakdown(project, costs),
    }
  end

  def self.project_breakdown(project, costs)
    root_costs = costs.roots.with_cost_type.where(project_id: project.id)

    root_costs.reduce([]) do |breakdown, root_cost|
      breakdown.push(self.cost_breakdown(costs, root_cost))
      breakdown
    end
  end

  def self.cost_breakdown(costs, cost)
    breakdown = []

    cost.cost_type.children.each do |child_cost_type|
      costs.where(cost_type_id: child_cost_type.id).map do |sub_cost|
        breakdown.push(self.cost_breakdown(costs, sub_cost))
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
