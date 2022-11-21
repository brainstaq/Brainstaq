class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name, presence: true
      t.text :description, presence: true
      t.decimal :price, precision: 8, scale: 2, default: 5.00
      t.string :slug
      t.string :image
      t.string :handout
      t.boolean :released, default: false
      
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
