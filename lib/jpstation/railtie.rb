require 'rails'
require 'jpstation/csv/importable'
require 'jpstation/csv/railway_company_header'
require 'jpstation/csv/railway_line_header'
require 'jpstation/csv/railway_station_header'

module Jpstation
  class Railtie < Rails::Railtie
    initializer 'railway models' do
      ActiveSupport.on_load :active_record do
        [ RailwayCompany, RailwayLine, RailwayStation ].each do |klass|
          klass.send :extend, Jpstation::CSV::const_get("#{klass}Header")
          klass.send :extend, Jpstation::CSV::Importable
        end
      end
    end

    rake_tasks do
      load 'jpstation/tasks.rb'
    end
  end
end
