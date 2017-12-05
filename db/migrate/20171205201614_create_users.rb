class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password
      t.string :github_token
      t.string :github_id
      t.string :image_url

      t.timestamps
    end
  end
end
