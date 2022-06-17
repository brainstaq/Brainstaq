class CreateTeamMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :team_members do |t|
      t.string :full_name
      t.text :position
      t.string :image
      t.text :bio
      t.references :enterprise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
