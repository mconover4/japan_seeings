class AddCommentsToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :comments, :string

  end

end
