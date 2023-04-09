class CreateCages < ActiveRecord::Migration[6.1]
  def change
    create_table :cages do |t|
      t.string :name
      t.timestamps
    end
    add_index :cages, :name
  end
end
