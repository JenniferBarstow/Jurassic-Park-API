class CreateDinosaurs < ActiveRecord::Migration[6.1]
  def change
    create_table :dinosaurs do |t|
      t.string :name, null: false
      t.references :species, foreign_key: true
      t.references :cage, foreign_key: true
      t.string :diet, null: false

      t.timestamps
    end
    add_index :dinosaurs, :name, unique: true
    add_index :dinosaurs, [:species_id, :diet]
  end
end
