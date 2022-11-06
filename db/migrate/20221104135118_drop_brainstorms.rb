class DropBrainstorms < ActiveRecord::Migration[6.1]
  def change
    drop_table :brainstorms, force: :cascade
  end
end
