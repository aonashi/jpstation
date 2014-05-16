module Jpstation
  class Import
    def execute
      if ENV["FILE_DIR"].blank?
        puts "Specify FILE_DIR arguments."
        puts "rake jpstation:import FILE_DIR=/path/to/jpstation_dir"
      else
        file_dir = ENV["FILE_DIR"]

        company_files = Dir.glob(File.join(file_dir, 'company*.csv'))
        line_files = Dir.glob(File.join(file_dir, 'line*.csv'))
        station_files = Dir.glob(File.join(file_dir, 'station*.csv'))

        if company_files.blank? || line_files.blank? || station_files.blank?
          abort "Railway data is not found."
        end

        puts "== jpstation: importing ======================================================="
        puts "-- Setup import files"
        puts "   RailwayCompany : " + company_files.first.sub("#{file_dir}/", "")
        puts "   RailwayLine    : " + line_files.first.sub("#{file_dir}/", "")
        puts "   RailwayStation : " + station_files.first.sub("#{file_dir}/", "")
        puts ""

        import_model RailwayCompany, company_files.first
        import_model RailwayLine, line_files.first
        import_model RailwayStation, station_files.first

        puts "== jpstation: imported ========================================================"
      end
    end

    def import_model(klass, file)
      puts "-- import #{klass.table_name}"
      time = Benchmark.measure { klass.import(file) }
      puts "   -> (%.4fs)" % time.real
    end
  end
end
