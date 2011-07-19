class AddCpfAndNeighborhoodToAddresses < ActiveRecord::Migration
  def self.up
    add_column :addresses, :cpf, :string
    add_column :addresses, :neighborhood, :string
  end

  def self.down
    remove_column :addresses, :neighborhood
    remove_column :addresses, :cpf
  end
end