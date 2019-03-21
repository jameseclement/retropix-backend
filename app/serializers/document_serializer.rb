class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :title, :created_at, :updated_at
  has_many :versions, serializer: DocumentVersionSerializer
end