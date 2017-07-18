class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :condicion
      t.boolean :finished
      t.datetime :finishdate
      t.datetime :startdate
      t.integer :price
      t.integer :beneficio
      t.integer :iva
      t.string :contactoprincipal
      t.integer :category_id

      t.timestamps
    end
  end
end
