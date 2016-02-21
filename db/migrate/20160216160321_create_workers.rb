class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :name, null: false
      t.string :br_id, null: false
      t.integer :state_id
      t.integer :region_id
      t.integer :industry_id
      t.integer :sub_industry_id
      t.date :dob
      t.string :gender
      t.text :photo
      t.text :address
      t.string :email
      t.string :mobile_no
      t.string :proof_docs
      t.text :photo_id_proof
      t.string :languages, array: true
      t.string :education
      t.string :special_course
      t.text :college
      t.string :address_proof_docs
      t.text :address_proof_photo
      t.text :skills
      t.string :current_status
      t.integer :years_of_experience
      t.string :job_title
      t.text :job_description
      t.text :member_of_any_labor_union, default: 'NO'
      t.text :key_words
      t.string :location_of_job
      t.string :specialized_skill
      t.text :supervisors_reference
      t.integer :previous_salary


      t.timestamps null: false
    end
  end
end