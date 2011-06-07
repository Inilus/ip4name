class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :name
      t.integer :user_id
      t.integer :domain_id
      t.integer :protocol_id

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
