json.extract! donor, :id, :name, :email, :user_id, :created_at, :updated_at
json.url donor_url(donor, format: :json)
