class CreateWatchlists < ActiveRecord::Migration[7.0]
  def change
    create_table :watchlists do |t|
      t.boolean :completed
      t.boolean :to_watch
      t.string :movie_review
      t.integer :movie_id

      t.timestamps
    end
  end
end
