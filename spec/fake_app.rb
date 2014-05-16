# -*- coding: utf-8 -*-
require 'active_record'

# database
ActiveRecord::Base.configurations = {'test' => {adapter: 'sqlite3', database: ':memory:'}}
ActiveRecord::Base.establish_connection(:test)

# config
app = Class.new(Rails::Application)
app.config.secret_token = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
app.config.session_store :cookie_store, key: "_fakeapp_session"
app.config.active_support.deprecation = :log
app.config.eager_load = false
app.initialize!

# migrations
ActiveRecord::Migration.verbose = false
Dir[File.join(File.dirname(__FILE__), '../lib/generators/templates/migrations/*.rb')].each { |f| require f }
CreatePrefectures.migrate :up
CreateRailwayCompanies.migrate :up
CreateRailwayLines.migrate :up
CreateRailwayStations.migrate :up
