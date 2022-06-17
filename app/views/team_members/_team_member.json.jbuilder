json.extract! team_member, :id, :full_name, :position, :image, :bio, :created_at, :updated_at
json.url team_member_url(team_member, format: :json)
