class CreateClients < ActiveRecord::Migration[5.0]
  def self.up
    create_table :clients do |t|
      t.references :region, foreign_key: true
      t.string :name
      t.boolean :is_active

      t.timestamps
    end
  end
  def self.down
    drop_table :clients
  end
end
