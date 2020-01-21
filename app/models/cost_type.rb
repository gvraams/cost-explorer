class CostType < ActiveRecord::Base
  belongs_to :parent, foreign_key: :parent_id, class_name: "CostType"
end
