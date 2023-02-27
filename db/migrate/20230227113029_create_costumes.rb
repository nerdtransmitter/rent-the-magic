class CreateCostumes < ActiveRecord::Migration[7.0]
  def change
    create_table :costumes do |t|
      t.string :size
      t.float :price
      t.string :name
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
