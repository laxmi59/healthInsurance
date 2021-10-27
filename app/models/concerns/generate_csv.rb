require 'csv'
module GenerateCsv
  extend ActiveSupport::Concern

  class_methods do
    def generate_csv(attributes)
      CSV.generate(headers: true) do |csv|
        csv << attributes

        all.each do |emp|
          csv << attributes.map{ |attr| emp.send(attr) }
        end
      end
    end
  end
end
