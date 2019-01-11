class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :admission_number
      t.string :department
      t.string :year_of_admission
      t.string :year_of_completion
      t.string :gender
      t.date :DOB
      t.string :Image

      t.timestamps
    end
  end
end
