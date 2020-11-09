json.extract! listing, :id, :title, :description, :job_type, :location, :user_id, :remote_ok, :created_at, :updated_at
json.url listing_url(listing, format: :json)
