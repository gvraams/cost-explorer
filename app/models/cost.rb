class Cost < ActiveRecord::Base
  belongs_to :project
  belongs_to :cost_type
end
