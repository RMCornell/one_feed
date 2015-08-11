class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.references :user, index: true, foreign_key: true
      t.string :provider
      t.string :uid
      t.string :string
      t.string :access_token
      t.string :access_token_secret
      t.string :refresh_token
      t.string :name
      t.string :email
      t.string :nickname
      t.string :image
      t.string :phone
      t.string :urls

      t.timestamps null: false
    end
  end
end
