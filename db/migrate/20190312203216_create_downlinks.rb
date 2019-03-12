class CreateDownlinks < ActiveRecord::Migration
  def change
    create_table :downlinks do |t|
      t.string :title
      t.string :message 
  end
end
