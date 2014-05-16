class RailwayStation < ActiveRecord::Base
  belongs_to :railway_line
  belongs_to :prefecture
  has_many :group_stations, class_name: :RailwayStation, foreign_key: :group_station_id
  default_scope { order(:sort, :id) }
end
