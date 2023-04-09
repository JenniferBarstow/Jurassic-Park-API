class AddPowerStatusToCage < ActiveRecord::Migration[6.1]
  def change
    add_column :cages, :power_status, :string, default: 'active'
  end
end
