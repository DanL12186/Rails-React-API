class AddListIdColumnToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :list_id, :integer
  end
end
