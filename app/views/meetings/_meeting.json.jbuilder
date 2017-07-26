json.extract! meeting, :id, :title, :date, :location, :description, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)
