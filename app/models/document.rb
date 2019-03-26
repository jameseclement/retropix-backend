class Document < ApplicationRecord
  belongs_to :user
  has_many :versions 
  accepts_nested_attributes_for :versions

  def current_version
    self.versions.order("created_at ASC").last
  end

  def revert_version(version_id)
    next_id = version_id.to_i+1
    last_id = self.versions.last.id
    version_ids = self.versions.where(id: next_id..last_id).pluck(:id)
    Version.destroy(version_ids)
    return version_ids
  end
end
