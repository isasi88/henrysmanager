json.extract! cliente, :id, :name, :telephone, :email, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
