class Offer < ApplicationRecord
  include ActiveStorageSupport::SupportForBase64

  belongs_to :user
  has_one_base64_attached :image
end
