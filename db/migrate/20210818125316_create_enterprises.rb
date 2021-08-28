class CreateEnterprises < ActiveRecord::Migration[6.1]
  def change
    create_table :enterprises do |t|
      t.string :name
      t.string :enterprise_category
      t.string :address
      t.string :email
      t.integer :phone_number, :integer, limit: 8
      t.string :country
      t.string :state
      t.string :logo
      t.text :info
      t.string :slug
      t.integer :status
      t.string :city
      t.index :slug, :unique => true

      t.timestamps
    end
  end
end
