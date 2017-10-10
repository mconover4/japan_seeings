class AddDetailsToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :details, :string

  end

end
