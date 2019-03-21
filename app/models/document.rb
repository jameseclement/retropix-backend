class Document < ApplicationRecord
  belongs_to :user
  has_many :versions 

  def current_version
    self.versions.order("created_at ASC").last
  end
end
