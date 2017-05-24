class CreateRawExecutives < ActiveRecord::Migration[5.0]
  def self.up
    create_table :raw_executives do |t|
      t.datetime :month
      t.references :client, foreign_key: true
      t.float :revenue
      t.float :ebit
      t.float :fte
      t.float :ticket
      t.float :sla_scope
      t.float :sla_attain

      t.timestamps
    end
  end
  def self.down
    drop_table :raw_executives
  end
end
