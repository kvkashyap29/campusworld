class CreateTextbooks < ActiveRecord::Migration[5.2]
  def change
    create_table :textbooks do |t|
      t.string :name
      t.string :image
      t.string :author
      t.string :publications

      t.timestamps
    end
  end
end
