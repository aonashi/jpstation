require 'spec_helper'
require 'generators/jpstation/models_generator'

describe Jpstation::Generators::ModelsGenerator do
  # Tell the generator where to put its output (what it thinks of as Rails.root)
  destination File.expand_path("../../../../tmp", __FILE__)

  before do
    prepare_destination
  end

  context 'when Prefecture model does not exist' do
    it 'should invoke model_generator 4 times' do
      g = generator %w(models)
      expect(Rails::Generators).to receive(:invoke).exactly(4).times
      capture(:stdout) { g.invoke_all }
    end
  end

  context 'when Prefecture model already exists' do
    it 'should invoke model_generator 3 times (except prefecture model)' do
      g = generator %w(models)
      allow(File).to receive(:exists?).with(File.join(destination_root, 'app/models/prefecture.rb')).and_return { true }
      expect(g).to receive(:inject_into_class).with('app/models/prefecture.rb', Prefecture, <<CODE)
  has_many :railway_stations
  def railway_lines
    RailwayLine.joins(:railway_stations).merge(railway_stations.reorder(nil)).distinct.order(:sort, :id)
  end
CODE
      expect(Rails::Generators).to receive(:invoke).exactly(3).times
      capture(:stdout) { g.invoke_all }
    end
  end
end
