class Prefecture < ActiveRecord::Base
  has_many :railway_stations
  def railway_lines
    RailwayLine.joins(:railway_stations).merge(railway_stations.reorder(nil)).distinct.order(:sort, :id)
  end
end
