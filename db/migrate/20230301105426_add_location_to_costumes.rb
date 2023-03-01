class AddLocationToCostumes < ActiveRecord::Migration[7.0]
  def change
    add_column :costumes, :location, :string
  end
end
