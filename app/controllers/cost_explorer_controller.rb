class CostExplorerController < ApplicationController
  def index
    clients = Client.all
    projects = Project.all

    client_ids = params["client_ids"] || []
    project_ids = params["project_ids"] || []

    clients = clients.where(id: client_ids) if client_ids.present?
    projects = projects.where(id: project_ids) if project_ids.present?

    breakdowns = CostUtil.get_clients_breakdown(clients, projects)
    return render json: Oj.dump(breakdowns.as_json, :compat)
  end
end
