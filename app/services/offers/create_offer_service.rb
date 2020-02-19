module Offers
  class CreateOfferService < ApplicationService

    def initialize(attrs = {})
      @form = attrs.fetch(:form)
      @user = attrs.fetch(:user)
    end

    def call
      return build_result(validation_error) if form.invalid?

      offer = @user.offers.create(form.to_hash)
      offer.image.attach(data: form.image)
      build_result(offer)
    end
  end
end
