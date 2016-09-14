json.extract! user, :id, :facebook_id, :last_login, :created_at, :updated_at
json.url user_url(user, format: :json)