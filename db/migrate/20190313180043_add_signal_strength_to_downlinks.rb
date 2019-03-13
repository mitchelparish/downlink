class AddSignalStrengthToDownlinks < ActiveRecord::Migration
  def change
    add_column :downlinks, :signal_strength, :integer
  end
end
