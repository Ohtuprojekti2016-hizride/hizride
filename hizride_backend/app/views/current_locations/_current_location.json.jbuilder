json.extract! current_location, :id, :lat, :lng, :user_id, :created_at, :updated_at
json.url current_location_url(current_location, format: :json)