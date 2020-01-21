class Projects < ActiveRecord::Migration
  def change
    create_table :projects, id: :uuid, index: true do |t|
      t.string :title, null: false
      t.uuid :client_id, null: false

      t.timestamps null: false
    end
  end
end
