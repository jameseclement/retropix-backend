class Document < ApplicationRecord
  belongs_to :user
  has_many :versions, dependent: :destroy
  accepts_nested_attributes_for :versions

  def current_version
    version = self.versions.order("created_at ASC").last
    if !version
      return {id: nil, data: "data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==

"}
    else
      return version
    end
  end

  def revert_version(version_id)
    next_id = version_id.to_i+1
    last_id = self.versions.last.id
    version_ids = self.versions.where(id: next_id..last_id).pluck(:id)
    Version.destroy(version_ids)
    return version_ids
  end
end
