class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :description
      t.string :image
      t.string :movie_rating
      t.string :release_date
      t.string :genre

   
    end
  end
end
