module Elasticsearch
  module Query
    module Offers
      class GetOffers < BaseClass

        def call
          {
            'query' => {
              'bool' => {
                'filter' => {
                  'bool' => {
                    'must' => [
                      user_id,
                      id,
                      title,
                      description,
                      price_gteq,
                      price_lteq
                    ].compact
                  }
                }
              }
            }, 'sort' => sort
          }
        end
      end
    end
  end
end
