class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |s|
      s.string :name
      s.string :location
      s.datetime :visited
      s.float :rating
    end
  end
end
