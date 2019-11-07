class CreateStepEquipments < ActiveRecord::Migration[6.0]
  def change
    create_table :step_equipments do |t|
      t.integer :step_id
      t.integer :equipment_id

      t.timestamps
    end
  end
end
