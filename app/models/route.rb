class Route < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :coordinates
end
