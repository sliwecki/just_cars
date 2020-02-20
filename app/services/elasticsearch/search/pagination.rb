module Elasticsearch
  module Search
    module Pagination

      def setup_pagination
        @page = params.fetch(:page, default_page).to_i
        @page = 1 unless page < default_page

        @per_page = params.fetch(:per_page, nil).to_i
        @per_page = default_per_page unless per_page.in?(minimum_per_page..maximum_per_page)
      end

      def default_page
        Settings.pagination.page.default
      end

      def default_per_page
        Settings.pagination.per_page.default
      end

      def minimum_per_page
        Settings.pagination.per_page.minimum
      end

      def maximum_per_page
        Settings.pagination.per_page.maximum
      end
    end
  end
end
