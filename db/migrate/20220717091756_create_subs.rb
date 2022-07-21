class CreateSubs < ActiveRecord::Migration[6.1]
  def change
    create_table :subs do |t|
      t.string :name
      t.integer :user_id
      t.integer :status
      t.string :interval

      t.timestamps
    end
  end
end
