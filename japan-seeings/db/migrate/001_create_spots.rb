class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |s|
      s.string :name
      s.integer :user_id
      s.string :location
      s.integer :time_of_visit
      s.float :rating
    end
  end
end
