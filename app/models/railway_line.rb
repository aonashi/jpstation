class RailwayLine < ActiveRecord::Base
  belongs_to :railway_company
  has_many :railway_stations
  default_scope { order(:sort, :id) }
end
