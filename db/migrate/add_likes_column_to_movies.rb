class AddLikesToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :like, :integer, default: 0
  end
end
