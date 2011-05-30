class CreateSubways < ActiveRecord::Migration
  def self.up
    create_table :subways do |t|
      t.integer :hour
      t.integer :day

      t.timestamps
    end
  end

  def self.down
    drop_table :subways
  end
end
