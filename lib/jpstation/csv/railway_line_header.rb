module Jpstation::CSV
  module RailwayLineHeader
    # http://www.ekidata.jp/doc/line.php
    def header_mapping
      {
        id:                 :line_cd,        # 路線コード
        railway_company_id: :company_cd,     # 事業者コード
        name:               :line_name,      # 路線名称（一般）
        kana_name:          :line_name_k,    # 路線名称（一般・カナ）
        official_name:      :line_name_h,    # 路線名称（正式名称）
        color_code:         :line_color_c,   # 路線カラー（コード）
        color_name:         :line_color_t,   # 路線カラー（名称）
        line_type:          :line_type,      # 路線区分
        longitude:          :lon,            # 路線表示時の中央経度
        latitude:           :lat,            # 路線表示時の中央緯度
        zoom:               :zoom,           # 路線表示時のGoogleMap倍率
        sort:               :e_sort          # 並び順
      }
    end
  end
end
