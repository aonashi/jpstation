require 'rails/generators/active_record'

module Jpstation
  module Generators
    class ModelGenerator < Rails::Generators::NamedBase
      Rails::Generators.hide_namespace self.namespace

      source_root File.expand_path('../../../../app/models', __FILE__)

      def copy_model
        template "#{name}.rb", "app/models/#{name}.rb"
      end

      hook_for :test_framework, as: :model
    end
  end
end

