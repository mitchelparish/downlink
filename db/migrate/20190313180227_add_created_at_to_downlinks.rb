class AddCreatedAtToDownlinks < ActiveRecord::Migration
  def change
    add_column :downlinks, :created_at, :datetime
  end
end
