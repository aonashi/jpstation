require 'active_record/fixtures'

namespace :jpstation do
  desc "Import railway data from download file"
  task import: :environment do
    import = Jpstation::Import.new
    import.execute
  end

  desc "Import prefecture data"
  task prefecture: :environment do
    ActiveRecord::Fixtures.create_fixtures(Jpstation::Engine.root.join('seed'), 'prefectures')
  end
end
