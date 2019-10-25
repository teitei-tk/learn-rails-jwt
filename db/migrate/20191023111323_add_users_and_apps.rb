class AddUsersAndApps < ActiveRecord::Migration[6.0]
  def up
    create_table :users do |t|
      t.string :name

      t.timestamps
    end

    create_table :applications do |t|
      t.string :name
      t.text :public_key
      t.text :website_url
      t.bigint :user_id

      t.timestamps
    end
  end

  def down
    drop_table :users
    drop_table :applications
  end
end
