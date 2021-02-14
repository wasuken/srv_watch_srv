class CreateServerLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :server_logs do |t|
      t.references :server, null: false, foreign_key: true
      t.references :log, null: false, foreign_key: true

      t.timestamps
    end
  end
end
