class AddResponseReferenceToDonations < ActiveRecord::Migration[6.0]
  def change
    add_column :donations, :response_reference, :string 
  end
end
