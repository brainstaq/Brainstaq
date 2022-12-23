class DropTeamMembersTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :team_members, force: :cascade

    add_column :positions, :full_name, :string
    add_column :positions, :image, :string
    add_column :positions, :bio, :text
  end
end
