class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :title
      t.datetime :created
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
