class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :name
      t.text :description
      t.integer :order
      t.integer :program_id

      t.timestamps null: false
    end
    add_index :levels, :program_id
  end
end
