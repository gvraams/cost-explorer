class CostExplorerController < ApplicationController
  def index
    clients = Client.all
    projects = Project.all
    cost_types = CostType.all

    client_ids = params[:client_ids] || []
    project_ids = params[:project_ids] || []
    cost_type_ids = params[:cost_type_ids] || []

    clients = clients.where(id: client_ids) if client_ids.present?
    projects = projects.where(id: project_ids) if project_ids.present?

    if cost_type_ids.present?
      cost_types = cost_types.where(id: cost_type_ids)
      cost_types = CostTypeUtil.get_cost_types_with_descendants(cost_types)
    end

    return not_found(["Client(s) not found"]) if clients.blank?
    return not_found(["Project(s) not found"]) if projects.blank?
    return not_found(["Cost type(s) not found"]) if cost_types.blank?

    costs = Cost.with_cost_type.where(cost_type: cost_types).
      joins("INNER JOIN projects p ON costs.project_id = p.id").
      where("costs.project_id IN (#{projects.select(:id).to_sql})").
      joins("INNER JOIN clients c ON c.id = p.client_id").
      where("c.id IN (#{clients.select(:id).to_sql})")

    breakdowns = CostUtil.get_clients_info(clients, projects, costs)

    return render json: Oj.dump(breakdowns.as_json, :compat)
  end
end
