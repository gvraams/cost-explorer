class Clients < ActiveRecord::Migration
  def change
    create_table :clients, id: :uuid, index: true do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
