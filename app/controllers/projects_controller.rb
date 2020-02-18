class ProjectsController < ApplicationController
  def index
    @projects = Project.all

    render json: @projects, each_serializer: ProjectSerializer
  end
end
