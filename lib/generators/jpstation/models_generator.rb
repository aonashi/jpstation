require 'rails/generators/active_record'

module Jpstation
  module Generators
    class ModelsGenerator < Rails::Generators::Base
      source_root File.expand_path('../../../../app/models', __FILE__)

      def generate_model
        if File.exists?(File.join(destination_root, 'app/models/prefecture.rb'))
          inject_into_class "app/models/prefecture.rb", Prefecture, <<CODE
  has_many :railway_stations
  def railway_lines
    RailwayLine.joins(:railway_stations).merge(railway_stations.reorder(nil)).distinct.order(:sort, :id)
  end
CODE
        else
          Rails::Generators.invoke 'jpstation:model', ['prefecture']
        end

        %w{ railway_company railway_line railway_station }.each do |model_name|
          Rails::Generators.invoke 'jpstation:model', [model_name]
        end
      end
    end
  end
end

