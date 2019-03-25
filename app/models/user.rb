class User < ApplicationRecord
  has_secure_password
  has_many :documents
  has_many :versions, through: :documents
  accepts_nested_attributes_for :documents
end
