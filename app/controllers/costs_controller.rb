class CostsController < ApplicationController
  def index
    @costs = Cost.all.includes(:cost_type)

    render json: @costs, each_serializer: CostSerializer
  end
end
