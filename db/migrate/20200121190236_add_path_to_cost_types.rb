class AddPathToCostTypes < ActiveRecord::Migration
  def change
    add_column :cost_types, :path, :ltree
    add_column :cost_types, :secondary_id, :serial
    add_column :cost_types, :secondary_parent_id, :integer
  end
end
