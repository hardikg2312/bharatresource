class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :name
      t.string :mobile_no
      t.string :email
      t.integer :worker_id

      t.timestamps null: false
    end
  end
end
