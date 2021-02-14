class CreateServers < ActiveRecord::Migration[6.0]
  def change
    create_table :servers do |t|
      t.text :name
      t.text :ip_address
      t.text :mac_address
      t.text :other_info

      t.timestamps
    end
  end
end
