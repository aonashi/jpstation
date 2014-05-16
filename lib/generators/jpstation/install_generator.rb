require 'rails/generators/base'
require 'rails/generators/active_record'

module Jpstation
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path('../../templates', __FILE__)

      def copy_migrations
        migration_template 'migrations/prefectures.rb',       'db/migrate/create_prefectures.rb' unless prefecture_model_exist?
        migration_template 'migrations/railway_companies.rb', 'db/migrate/create_railway_companies.rb'
        migration_template 'migrations/railway_lines.rb',     'db/migrate/create_railway_lines.rb'
        migration_template 'migrations/railway_stations.rb',  'db/migrate/create_railway_stations.rb'
      end

      def show_readme
        readme "README"
      end

      def self.next_migration_number(path)
        ActiveRecord::Generators::Base.next_migration_number(path)
      end

      private

      def prefecture_model_exist?
        File.exists?(File.join(destination_root, 'app/models/prefecture.rb'))
      end
    end
  end
end
