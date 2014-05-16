class RailwayCompany < ActiveRecord::Base
  has_many :railway_lines
  default_scope { order(:sort, :id) }
  # acts_as_paranoid
end
