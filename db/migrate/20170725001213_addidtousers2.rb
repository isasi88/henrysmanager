class Addidtousers2 < ActiveRecord::Migration
  def change
  	add_column :clientes, :user_id, :integer
  end
end
