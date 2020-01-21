class CostTypes < ActiveRecord::Migration
  def change
    create_table :cost_types, id: :uuid, index: true do |t|
      t.string :name, null: false
      t.uuid :parent_id

      t.timestamps null: false
    end
  end
end
