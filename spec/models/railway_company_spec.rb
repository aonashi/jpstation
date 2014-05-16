# -*- coding: utf-8 -*-
require 'spec_helper'

describe RailwayCompany do
  describe :import do
    let(:file_path) do
      tempfile = Tempfile.new('railway_companies.csv')
      tempfile << <<EOS
company_cd,rr_cd,company_name,company_name_k,company_name_h,company_name_r,company_url,company_type,e_status,e_sort
1,11,JR北海道,ジェイアールホッカイドウ,北海道旅客鉄道株式会社,JR北海道,http://www.jrhokkaido.co.jp/,1,0,1
2,11,JR東日本,ジェイアールヒガシニホン,東日本旅客鉄道株式会社,JR東日本,http://www.jreast.co.jp/,1,0,2
3,11,JR東海,ジェイアールトウカイ,東海旅客鉄道株式会社,JR東海,http://jr-central.co.jp/,1,0,3
4,11,JR西日本,ジェイアールニシニホン,西日本旅客鉄道株式会社,JR西日本,http://www.westjr.co.jp/,1,1,4
5,11,JR四国,ジェイアールシコク,四国旅客鉄道株式会社,JR四国,http://www.jr-shikoku.co.jp/,1,2,5
6,11,JR九州,ジェイアールキュウシュウ,九州旅客鉄道株式会社,JR九州,http://www.jrkyushu.co.jp/,1,2,6
EOS
      tempfile.close
      return tempfile.path
    end

    before do
      RailwayCompany.import(file_path)
    end

    describe :imported_count do
      subject { RailwayCompany.pluck(:id) }
      it { should match_array [1, 2, 3] }
    end

    describe :first_company do
      subject { RailwayCompany.find(1) }
      its(:name) { should eq 'JR北海道' }
      its(:railway_id) { should eq 11 }
      its(:kana_name) { should eq 'ジェイアールホッカイドウ' }
      its(:official_name) { should eq '北海道旅客鉄道株式会社' }
      its(:abbreviated_name) { should eq 'JR北海道' }
      its(:url) { should eq 'http://www.jrhokkaido.co.jp/' }
      its(:company_type) { should eq 1 }
      its(:sort) { should eq 1 }
    end
  end
end
