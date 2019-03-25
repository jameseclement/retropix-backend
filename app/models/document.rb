class Document < ApplicationRecord
  belongs_to :user
  has_many :versions 
  accepts_nested_attributes_for :versions

  def current_version
    self.versions.order("created_at ASC").last
  end
end
