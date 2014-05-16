module Jpstation::CSV
  module RailwayCompanyHeader
    # http://www.ekidata.jp/doc/company.php
    def header_mapping
      {
        id:               :company_cd,        # 事業者コード
        railway_id:       :rr_cd,             # 鉄道コード
        name:             :company_name,      # 事業者名（一般）
        kana_name:        :company_name_k,    # 事業者名（一般・カナ）
        official_name:    :company_name_h,    # 事業者名（正式名称）
        abbreviated_name: :company_name_r,    # 事業者名（略称）
        url:              :company_url,       # Webサイト
        company_type:     :company_type,      # 事業者区分
        sort:             :e_sort             # 並び順
      }
    end
  end
end
