class Addidtousers < ActiveRecord::Migration
  def change
  	add_column :meetings, :user_id, :integer
  	add_column :negociations, :user_id, :integer
  end
end
