# -*- coding: utf-8 -*-
require 'spec_helper'

describe RailwayStation do
  describe :import do
    let(:file_path) do
      tempfile = Tempfile.new('railway_stations.csv')
      tempfile << <<EOS
station_cd,station_g_cd,station_name,station_name_k,station_name_r,line_cd,pref_cd,post,add,lon,lat,open_ymd,close_ymd,e_status,e_sort
1110101,1110101,函館,,,11101,1,040-0063,北海道函館市若松町１２-１３,140.726413,41.773709,1902-12-10,,0,1110101
1110102,1110102,五稜郭,,,11101,1,041-0813,函館市亀田本町,140.733539,41.803557,,,0,1110102
1110103,1110103,桔梗,,,11101,1,041-1210,北海道函館市桔梗３丁目４１-３６,140.722952,41.846457,1902-12-10,,0,1110103
1110104,1110104,大中山,,,11101,1,041-1121,亀田郡七飯町大字大中山,140.71358,41.864641,,,0,1110104
1110105,1110105,七飯,,,11101,1,041-1111,亀田郡七飯町字本町,140.688556,41.886971,,,0,1110105
EOS
      tempfile.close
      return tempfile.path
    end

    before do
      RailwayStation.import(file_path)
    end

    subject { RailwayStation.find(1110101) }

    its(:group_station_id) { should eq 1110101 }
    its(:name) { should eq '函館' }
    its(:kana_name) { should be_nil  }
    its(:english_name) { should be_nil }
    its(:railway_line_id) { should eq 11101 }
    its(:prefecture_id) { should eq 1 }
    its(:zip_code) { should eq '040-0063' }
    its(:address) { should eq '北海道函館市若松町１２-１３' }
    its(:longitude) { should be_within(1.0e-6).of(140.726413) }
    its(:latitude) { should be_within(1.0e-6).of(41.773709) }
    its(:opened_at) { should eq Date.new(1902, 12, 10) }
    its(:closed_at) { should be_nil }
    its(:sort) { should eq 1110101 }
  end
end
