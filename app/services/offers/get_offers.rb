module Offers
  class GetOffers
    include Service

    def initialize(attrs = {})
      @params = attrs.fetch(:params)
      @user = attrs.fetch(:user)
    end

    def call
      #TODO search by ActiveRecord if Elastic is not working
      Elasticsearch::Search::Offers::GetOffers.new(params: params.merge!(user_id: user.id)).call
    end
  end
end
