class CostType < ActiveRecord::Base
  belongs_to :parent, class_name: "CostType"
  has_many :children, class_name: "CostType", foreign_key: "parent_id"
end
