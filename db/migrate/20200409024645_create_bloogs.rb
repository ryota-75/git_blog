class CreateBloogs < ActiveRecord::Migration[5.2]
  def change
    create_table :bloogs do |t|
      t.string  :name
      t.integer :user_id
      t.text :text
      t.timestamps
    end
  end
end
