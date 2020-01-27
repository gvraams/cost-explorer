class Cost < ActiveRecord::Base
  belongs_to :project
  belongs_to :cost_type

  scope :roots, -> { joins(:cost_type).where("cost_types.parent_id IS NULL") }
  scope :with_cost_type, -> { includes(:cost_type) }
end
