class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.integer :route_id
      t.integer :sequential_id
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
