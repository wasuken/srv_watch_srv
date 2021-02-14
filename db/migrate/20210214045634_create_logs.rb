class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.datetime :date_point
      t.text :name
      t.float :value

      t.timestamps
    end
  end
end
