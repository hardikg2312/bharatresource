class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.string :name_attr
      t.integer :state_id

      t.timestamps null: false
    end
  end
end
