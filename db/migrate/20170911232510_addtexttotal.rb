class Addtexttotal < ActiveRecord::Migration
  def change
  	add_column :meetings, :note, :text
  end
end
