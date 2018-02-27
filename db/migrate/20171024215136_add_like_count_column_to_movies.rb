class AddLikeCountColumnToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :likes, :integer
  end
end
