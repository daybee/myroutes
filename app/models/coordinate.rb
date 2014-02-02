class Coordinate < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :route_id, :sequential_id
  belongs_to :route
  acts_as_sequenced scope: :route_id
end
