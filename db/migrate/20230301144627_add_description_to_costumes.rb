class AddDescriptionToCostumes < ActiveRecord::Migration[7.0]
  def change
    add_column :costumes, :description, :text
  end
end
