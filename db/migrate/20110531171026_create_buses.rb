class CreateBuses < ActiveRecord::Migration
  def self.up
    create_table :buses do |t|
      t.integer :hour
      t.integer :day
      t.string :direction
      t.integer :number

      t.timestamps
    end
  end

  def self.down
    drop_table :buses
  end
end
