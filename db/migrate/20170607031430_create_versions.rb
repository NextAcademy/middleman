class CreateVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :versions do |t|
      t.string :title
      t.string :url
      t.string :logo
      t.text :description
      t.string :industry
      t.string :location
      t.string :engineers
      t.string :core_stack
      t.string :stage
      t.references :company, foreign_key: true
      t.timestamps
    end
  end
end
