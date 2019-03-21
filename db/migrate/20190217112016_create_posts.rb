class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :status
      t.string :name
      t.text :content
      t.date :published_at

      t.timestamps
    end
  end
end
