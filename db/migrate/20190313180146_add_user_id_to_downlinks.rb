class AddUserIdToDownlinks < ActiveRecord::Migration
  def change
    add_column :downlinks, :user_id, :integer
  end
end
