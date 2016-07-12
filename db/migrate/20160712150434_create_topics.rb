class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.integer :author_id
      t.integer :category_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
