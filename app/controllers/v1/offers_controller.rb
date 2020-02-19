module V1
  class OffersController < ApplicationController

    def index
      render json: Offers::OfferSerializer.new(offers, is_collection: true).serialized_json
    end

    def show
      render json: Offers::OfferSerializer.new(offer).serialized_json
    end

    def create
      form = Offers::CreateOfferForm.new(params_for_create)
      result = Offers::CreateOfferService.call(form: form, user: current_user)
      if result.error?
        render_error(result.object)
      else
        render json: Offers::OfferSerializer.new(result.object).serialized_json,
               status: :created
      end
    end

    private

    def params_for_create
      params.permit(:title, :description, :price, :image)
    end

    def offer
      @offer ||= current_user.offers.find(params[:id])
    end

    def offers
      @offers ||= current_user.offers
    end
  end
end
