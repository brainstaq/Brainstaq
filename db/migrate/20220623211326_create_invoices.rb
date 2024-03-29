class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.string :from_full_name
      t.string :from_address
      t.string :from_email
      t.string :from_phone
      t.string :to_full_name
      t.string :to_address
      t.string :to_email
      t.string :to_phone
      t.string :status
      t.decimal :discount
      t.decimal :vat
      t.integer :user_id
      t.references :enterprise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
