class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :title
      t.datetime :date
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
