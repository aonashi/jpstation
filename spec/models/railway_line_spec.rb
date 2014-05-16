# -*- coding: utf-8 -*-
require 'spec_helper'

describe RailwayLine do
  describe :import do
    let(:file_path) do
      tempfile = Tempfile.new('railway_lines.csv')
      tempfile << <<EOS
line_cd,company_cd,line_name,line_name_k,line_name_h,line_color_c,line_color_t,line_type,lon,lat,zoom,e_status,e_sort
1001,3,中央新幹線,チュウオウシンカンセン,中央新幹線,,,,137.493896484375,35.411438052435486,8,1,1001
1002,3,東海道新幹線,トウカイドウシンカンセン,東海道新幹線,,,,137.72148868198997,35.144121935482794,7,0,1002
1003,4,山陽新幹線,サンヨウシンカンセン,山陽新幹線,,,,133.14789611677998,34.41933769953404,7,0,1003
11101,1,JR函館本線(函館～長万部),ハコダテホンセン,JR函館本線(函館～長万部),,,,140.4833696755387,42.23981411231523,9,0,11101
11102,1,JR函館本線(長万部～小樽),ハコダテホンセン,JR函館本線(長万部～小樽),,,,140.64288780797756,42.919910231257624,9,0,11102
11103,1,JR函館本線(小樽～旭川),ハコダテホンセン,JR函館本線(小樽～旭川),,,,141.69791081566132,43.41509739716935,9,0,11103
EOS
      tempfile.close
      return tempfile.path
    end

    before do
      RailwayLine.import(file_path)
    end

    subject { RailwayLine.find(11101) }

    its(:railway_company_id) { should eq 1 }
    its(:name) { should eq 'JR函館本線(函館～長万部)' }
    its(:kana_name) { should eq 'ハコダテホンセン' }
    its(:official_name) { should eq 'JR函館本線(函館～長万部)' }
    its(:color_code) { should be_nil }
    its(:color_name) { should be_nil }
    its(:line_type) { should be_nil }
    its(:longitude) { should be_within(1.0e-12).of(140.4833696755387) }
    its(:latitude) { should be_within(1.0e-12).of(42.23981411231523) }
    its(:zoom) { should eq 9 }
    its(:sort) { should eq 11101 }
  end
end
