module Elasticsearch
  module Search
    class BaseClass
      include Elasticsearch::Search::Pagination

      def initialize(attrs={})
        @params = attrs.fetch(:params)
        @sort_by = @params.fetch(:sort_by, '').to_sym
        @sort_order = @params.fetch(:sort_order, :asc).to_sym
        setup_pagination
      end

      def call
        return @result if @result
        @result = collection_class_name.__elasticsearch__.search(query).page(page).per(per_page)
        return @result unless @result.any?
        @result = @result.records
      end

      private

      attr_reader :params, :sort_by, :sort_order, :page, :per_page

      def collection_class_name
        raise 'No implementation'
      end

      def query_class_name
        raise 'No implementation'
      end

      def query
        query_class_name.new(params: params, sort_order: sort_order, sort_by: sort_by).call
      end
    end
  end
end
