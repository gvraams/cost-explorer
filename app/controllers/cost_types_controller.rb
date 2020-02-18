class CostTypesController < ApplicationController
  def index
    @cost_types = CostType.all

    render json: @cost_types, each_serializer: CostTypeSerializer
  end
end
