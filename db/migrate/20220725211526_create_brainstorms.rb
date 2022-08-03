class CreateBrainstorms < ActiveRecord::Migration[6.1]
  def change
    create_table :brainstorms do |t|
      t.text :problem
      t.string :token

      t.timestamps
    end
  end
end
