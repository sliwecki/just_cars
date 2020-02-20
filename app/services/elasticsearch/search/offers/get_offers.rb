module Elasticsearch
  module Search
    module Offers
      class GetOffers < BaseClass

        private

        def collection_class_name
          Offer
        end

        def query_class_name
          Elasticsearch::Query::Offers::GetOffers
        end
      end
    end
  end
end
