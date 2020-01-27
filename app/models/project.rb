class Project < ActiveRecord::Base
  belongs_to :client
  has_many :costs

  def amount
    self.costs.roots.sum(:amount)
  end
end
