class Project < ActiveRecord::Base
  belongs_to :client
  has_many :costs

  def amount
    self.costs.joins(:cost_type).where("cost_types.parent_id IS NULL").sum(:amount)
  end
end
