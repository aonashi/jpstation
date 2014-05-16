module Jpstation::CSV
  module RailwayStationHeader
    # http://www.ekidata.jp/doc/station.php
    def header_mapping
      {
        id:               :station_cd,        # 駅コード
        group_station_id: :station_g_cd,      # 駅グループコード
        name:             :station_name,      # 駅名称
        kana_name:        :station_name_k,    # 駅名称（カナ）
        english_name:     :station_namr_r,    # 駅名称（ローマ字）
        railway_line_id:  :line_cd,           # 路線コード
        prefecture_id:    :pref_cd,           # 都道府県コード
        zip_code:         :post,              # 郵便番号
        address:          :add,               # 住所
        longitude:        :lon,               # 緯度
        latitude:         :lat,               # 経度
        opened_at:        :open_ymd,          # 開業年月日
        closed_at:        :close_ymd,         # 廃止年月日
        sort:             :e_sort,            # 並び順
      }
    end
  end
end
