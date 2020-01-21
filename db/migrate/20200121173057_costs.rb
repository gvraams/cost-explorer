class Costs < ActiveRecord::Migration
  def change
    create_table :costs, id: :uuid, index: true do |t|
      t.integer :amount, null: false
      t.uuid :cost_type_id, null: false
      t.uuid :project_id, null: false

      t.timestamps null: false
    end
  end
end
