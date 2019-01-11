class CreateAttendences < ActiveRecord::Migration[5.2]
  def change
    create_table :attendences do |t|
      t.string :status
      t.date :date
      t.string :student_id

      t.timestamps
    end
  end
end
