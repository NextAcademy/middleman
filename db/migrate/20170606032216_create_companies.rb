class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :title
      t.string :url
      t.string :full_name
      t.string :logo
      t.text :description
      t.string :industry
      t.string :location
      t.string :engineers
      t.string :core_stack, array: true
      t.string :stage

      t.string :email, null: false
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false
      t.timestamps null: false
    end

    add_index :companies, :email
    add_index :companies, :remember_token
  end
end
