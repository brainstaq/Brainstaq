class DropWorkingCapitals < ActiveRecord::Migration[6.1]
  def change
    drop_table :working_capitals, force: :cascade
  end
end
