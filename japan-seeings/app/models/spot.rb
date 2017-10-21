class Spot < ActiveRecord::Base
  belongs_to :user

  validates :name, :location, :rating, :user_id, :time_of_visit, presence: true
end
