class AddNeighborhoodToAddresses < ActiveRecord::Migration
  def self.up
    
    change_table :addresses do |t|
      t.string :neighborhood
      t.string :phone_area
      t.string :alternative_phone_area
      t.string :number
    end
    
  end

  def self.down
    
    change_table :addresses do |t|
      t.remove :neighborhood
      t.remove :phone_area
      t.remove :alternative_phone_area
      t.remove :number
    end
    
  end
end