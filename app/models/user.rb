class User < ApplicationRecord
  has_many :documents
  has_many :versions, through: :documents
  has_secure_password
end
