class User < ApplicationRecord

  has_many :offers
  has_secure_password
end
