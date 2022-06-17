json.extract! portfolio, :id, :title, :description, :location, :image, :created_at, :updated_at
json.url portfolio_url(portfolio, format: :json)
