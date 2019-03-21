class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :title, :created_at, :updated_at, :current_version
  has_many :versions
end
