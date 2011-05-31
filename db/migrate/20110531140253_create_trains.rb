class CreateTrains < ActiveRecord::Migration
  def self.up
    create_table :trains do |t|
      t.integer :hour
      t.integer :day
      t.string :direction

      t.timestamps
    end
  end

  def self.down
    drop_table :trains
  end
end
