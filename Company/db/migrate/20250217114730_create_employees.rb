class CreateEmployees < ActiveRecord::Migration[8.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.text :address
      t.string :gender
      t.boolean :active, default: false
      t.references :department, null: false, foreign_key: true
      t.timestamps
    end
  end
end
