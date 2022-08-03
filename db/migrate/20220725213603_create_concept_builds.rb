class CreateConceptBuilds < ActiveRecord::Migration[6.1]
  def change
    create_table :concept_builds do |t|
      t.string :concept_build_text
      t.belongs_to :concept
      t.integer :votes, default: 0

      t.timestamps
    end
  end
end
