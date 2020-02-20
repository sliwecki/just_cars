module Elasticsearch
  module Query
    class BaseClass
      include Elasticsearch::Query::Conditions

      def initialize(attrs={})
        @params = attrs.fetch(:params)
        @sort_by = attrs.fetch(:sort_by)
        @sort_order = attrs.fetch(:sort_order)
      end

      def call
        raise 'No implementation'
      end

      private

      attr_reader :params, :sort_by, :sort_order
    end
  end
end
