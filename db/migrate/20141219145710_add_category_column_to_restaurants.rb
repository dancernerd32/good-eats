class AddCategoryColumnToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :category, :string
  end
end
