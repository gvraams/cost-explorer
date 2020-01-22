class Client < ActiveRecord::Base
  has_many :projects
  has_many :costs, through: :projects

  def amount
    self.projects.reduce(0) do |sum, project|
      sum += project.amount
      sum
    end
  end
end
