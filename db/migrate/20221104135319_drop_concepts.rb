class DropConcepts < ActiveRecord::Migration[6.1]
  def change
    drop_table :concepts, force: :cascade
    drop_table :concept_builds, force: :cascade
  end
end
