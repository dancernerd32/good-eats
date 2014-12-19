class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.text :body, null: false
      t.timestamps
      t.integer :restaurant_id, null: false
    end
  end
end
