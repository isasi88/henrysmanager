class CreateNegociations < ActiveRecord::Migration
  def change
    create_table :negociations do |t|
      t.string :title
      t.text :description
      t.string :telephone
      t.string :email
      t.string :business
      t.string :state

      t.timestamps
    end
  end
end
