class CreateTextbooks < ActiveRecord::Migration[5.2]
  def change
    create_table :textbooks do |t|
      t.text :name
      t.text :image
      t.text :author
      t.text :publications
      t.text :dlink
      t.timestamps
    end
  end
end
