module Offers
  class CreateOfferForm < ApplicationForm

    attribute :title, String
    attribute :description, String
    attribute :price, Integer
    attribute :image, String

    validates :title,
              presence: true,
              length: { maximum: 20 }

    validates :description,
              presence: true,
              length: { maximum: 500 }

    validates :price,
              presence: true,
              numericality: { greater_than: 0 }

    def to_hash
      super.except(:image)
    end
  end
end
