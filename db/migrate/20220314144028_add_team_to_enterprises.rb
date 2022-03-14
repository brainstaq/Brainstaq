class AddTeamToEnterprises < ActiveRecord::Migration[6.1]
  def change
    add_column :enterprises, :team, :text
  end
end
