class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :heading
      t.string :content
      t.integer :user_id
      t.integer :movie_id
      t.integer :show_id
      
      t.timestamps
    end
  end
end
