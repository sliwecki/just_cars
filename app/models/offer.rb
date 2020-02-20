class Offer < ApplicationRecord
  include ActiveStorageSupport::SupportForBase64
  include Offers::Searchable

  belongs_to :user
  has_one_base64_attached :image
end
