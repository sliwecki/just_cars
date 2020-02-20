module Offers
  class GetOffer
    include Service

    def initialize(attrs = {})
      @params = attrs.fetch(:params)
      @user = attrs.fetch(:user)
    end

    def call
      user.offers.find(params[:id])
    end
  end
end
