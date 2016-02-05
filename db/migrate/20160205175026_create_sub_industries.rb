class CreateSubIndustries < ActiveRecord::Migration
  def change
    create_table :sub_industries do |t|
      t.string :name
      t.integer :industry_id

      t.timestamps null: false
    end
  end
end
