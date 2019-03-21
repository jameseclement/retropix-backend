class CreateVersions < ActiveRecord::Migration[5.2]
  def change
    create_table :versions do |t|
      t.string :data
      t.datetime :time
      t.belongs_to :document, foreign_key: true

      t.timestamps
    end
  end
end
