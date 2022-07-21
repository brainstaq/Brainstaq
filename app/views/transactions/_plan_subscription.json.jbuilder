json.extract! plan_subscription, :id, :plan_code, :amount, :lawfirm_id, :expires_on, :amount, :reference, :customer_code, :customer_id, :paid_at, :created_at, :updated_at
json.url plan_subscription_url(plan_subscription, format: :json)
