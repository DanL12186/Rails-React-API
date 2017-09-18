class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.float :rating
      t.integer :votes
      t.string :mpaa

      t.timestamps
    end
  end
end
