class AddMovieIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :about, :string
  end
end
