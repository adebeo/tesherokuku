class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.text :description
      t.string :lien
      t.integer :order
      t.integer :level_id

      t.timestamps null: false
    end
    add_index :questions, :level_id
  end
end
