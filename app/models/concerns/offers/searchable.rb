module Offers
  module Searchable
    extend ActiveSupport::Concern

    included do
      include Elasticsearch::Model
      include Elasticsearch::Model::Callbacks

      settings index: { number_of_shards: 1 } do
        mappings dynamic: false do
          indexes :id, type: :long
          indexes :title, type: :text
          indexes :description, type: :text
          indexes :price, type: :long
          indexes :user_id, type: :long
        end
      end

      def as_indexed_json(options = {})
        self.as_json(only: [:id, :title, :description, :price, :user_id])
      end
    end
  end
end
