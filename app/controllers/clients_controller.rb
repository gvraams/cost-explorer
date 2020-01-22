class ClientsController < ApplicationController
  def index
    @clients = Client.all

    render json: @clients, each_serializer: ClientSerializer
  end
end
