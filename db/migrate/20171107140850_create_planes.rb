class CreatePlanes < ActiveRecord::Migration[5.1]
  def change
    create_table :planes do |t|
      t.integer :city_id
      t.string :name
      t.timestamps
    end
  end
end
