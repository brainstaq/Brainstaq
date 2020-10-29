class FixDateInIdeas < ActiveRecord::Migration[6.0]
  def change
    remove_column :ideas, :expires_at, :datetime, default: 40.days.from_now
    add_column :ideas, :end_date, :date
  end
end
