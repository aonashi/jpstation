require 'spec_helper'
require 'generators/jpstation/model_generator'

describe Jpstation::Generators::ModelGenerator do
  # Tell the generator where to put its output (what it thinks of as Rails.root)
  destination File.expand_path("../../../../tmp", __FILE__)

  before do
    prepare_destination
  end

  describe 'generate RailwayCompany model' do
    before { run_generator %w{ railway_company } }
    subject { file('app/models/railway_company.rb') }
    it { should exist }
    it { should contain "has_many :railway_lines" }
  end

  describe 'generate RailwayLine model' do
    before { run_generator %w{ railway_line } }
    subject { file('app/models/railway_line.rb') }
    it { should exist }
    it { should contain "has_many :railway_stations" }
  end

  describe 'generate RailwayStation model' do
    before { run_generator %w{ railway_station } }
    subject { file('app/models/railway_station.rb') }
    it { should exist }
    it { should contain "belongs_to :railway_line" }
  end
end
