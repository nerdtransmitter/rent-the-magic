class AddAddressToCostumes < ActiveRecord::Migration[7.0]
  def change
    add_column :costumes, :latitude, :float
    add_column :costumes, :longitude, :float
  end
end
