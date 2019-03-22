class ChangeDataToBeTextInVersions < ActiveRecord::Migration[5.2]
  def change
    change_column :versions, :data, :text
  end
end
