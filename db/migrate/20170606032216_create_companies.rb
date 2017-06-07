class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :title
      t.string :url
      t.string :logo
      t.text :description
      t.string :industry
      t.string :location
      t.string :engineers
      t.string :core_stack, array: true
      t.string :stage
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
