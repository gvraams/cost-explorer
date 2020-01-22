class CostExplorerController < ApplicationController
  def index
    # TODO: Do filtering with query params
    clients = Client.all
    breakdowns = CostUtil.get_client_breakdown(clients)

    return render json: Oj.dump(breakdowns.as_json, :compat)
  end
end
