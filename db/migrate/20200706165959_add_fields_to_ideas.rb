class AddFieldsToIdeas < ActiveRecord::Migration[6.0]
  def change
    add_column :ideas, :donated_amount, :integer, default: 0
    add_column :ideas, :expires_at, :datetime, :default => DateTime.now + 38.days
    add_column :ideas, :status, :string, default: "active"
  end
end
 