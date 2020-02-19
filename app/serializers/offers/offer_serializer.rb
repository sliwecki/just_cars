module Offers
  class OfferSerializer < ApplicationSerializer

    attributes :title
    attributes :description
    attributes :price
    attribute :image_url do |object|
      UrlHelper.instance.url_for(object.image) if object.image.attached?
    end
  end
end
