require 'csv'

module Jpstation::CSV
  module Importable
    def paranoid?
      column_names.include? "deleted_at"
    end

    def import(file)
      current_ids = []
      CSV.foreach(file, headers: true, converters: :numeric, header_converters: :symbol) do |row|
        if row[:e_status] == 0 || paranoid?
          model = unscoped.find_or_initialize_by(id: row.first)
          model.assign_attributes(header_mapping.inject({}) { |attr, (k, v)| attr[k] = row[v]; attr })
          model.deleted_at = (row[:e_status] == 0) ? nil : Time.now if paranoid?
          model.save!
          current_ids << model.id
        end
      end
      unscoped.where.not(id: current_ids).destroy_all
    end
  end
end
