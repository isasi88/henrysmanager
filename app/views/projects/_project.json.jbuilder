json.extract! project, :id, :title, :description, :condicion, :finished, :finishdate, :startdate, :price, :beneficio, :iva, :contactoprincipal, :category_id, :created_at, :updated_at
json.url project_url(project, format: :json)
