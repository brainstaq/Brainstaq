class CreateConcepts < ActiveRecord::Migration[6.1]
  def change
    create_table :concepts do |t|
      t.string :text
      t.belongs_to :brainstorm
      t.integer :votes, default: 0
      
      t.timestamps
    end
  end
end