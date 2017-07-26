class AddClienteIdToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :cliente_id, :integer
  end
end
