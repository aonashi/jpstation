require 'spec_helper'
require 'generators/jpstation/install_generator'

describe Jpstation::Generators::InstallGenerator do
  # Tell the generator where to put its output (what it thinks of as Rails.root)
  destination File.expand_path("../../../../tmp", __FILE__)

  before do
    prepare_destination
  end

  it 'should run all tasks in the generator' do
    g = generator %w(install)
    expect(g).to receive(:copy_migrations)
    capture(:stdout) { g.invoke_all }
  end

  describe 'db/migrate/create_prefectures.rb' do
    subject { file("db/migrate/create_prefectures.rb") }

    context 'when Prefecture model already exists' do
      it do
        pending "not work 'should_not be_a_migration' if file does not exist" do
          allow(File).to receive(:exists?).with(File.join(destination_root, 'app/models/prefecture.rb')).and_return { true }
          run_generator
          should_not be_a_migration
        end
      end
    end

    context 'when Prefecture model does not exist' do
      before { run_generator }
      it { should be_a_migration }
    end
  end

  %w{ railway_companies railway_lines railway_stations }.each do |table_name|
    describe "db/migrate/create_#{table_name}.rb" do
      before { run_generator }
      subject { file("db/migrate/create_#{table_name}.rb") }
      it { should be_a_migration }
    end
  end
end
