module UiBibz::Ui
  class Store

    attr_accessor :records

    def initialize records
      @records = records
    end

    def total_pages
      @records.total_pages
    end

    def current_page
      @records.current_page
    end

    def limit_value
      @records.limit_value
    end

    def columns
      @columns ||= @records.new.attributes.keys.map{ |record| Column.new({ data_index: record, name: record.humanize }) }
    end

    def model
      @model ||= @records.new.class.to_s
    end

    def controller
      model.downcase.pluralize
    end

  end
end