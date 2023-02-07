class CreateAccountDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :account_details do |t|
      t.datetime :subscribe_date
      t.datetime :unsubscribe_date
      t.datetime :expiry_date
      t.integer :user_status
      t.integer :pause_permit_count, default: 0
      t.datetime :pause_start_date
      t.datetime :pause_cancel_date
      t.integer :amount
      t.boolean :recurring_billing
      t.references :user, index: true

      t.timestamps
    end
    create_table :charges do |t|
      t.string :service_plan
      t.integer :amount
      t.string :payment_method
      t.string :duration
      t.string :brainstaq_transaction_id
      t.references :user, foreign_key: true
      
      t.timestamps
    end

    create_table :paystack_charges do |t|
      t.datetime :paid_at
      t.string :plan
      t.integer :amount
      t.string :channel
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :paystack_charges, :created_at
  end
end
