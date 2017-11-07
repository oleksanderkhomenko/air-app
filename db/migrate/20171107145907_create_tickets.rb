class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.integer :plane_id
      t.string :name
      t.timestamps
    end
  end
end
