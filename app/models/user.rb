class User < ApplicationRecord
  has_many :documents
  has_many :versions, through: :documents
end
