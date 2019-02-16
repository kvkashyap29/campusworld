class CreateAttendences < ActiveRecord::Migration[5.2]
   def change
    create_table :attendences do |t|
      t.string :status
      t.date :date
      t.integer :student_id
      t.timestamps
    end

    add_index :attendences, :student_id
  end
end
