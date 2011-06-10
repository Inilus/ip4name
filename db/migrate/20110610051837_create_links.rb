class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.references :user
      t.references :domain, :null => false
      t.text    :url,       :null => false,   :limit => 2073
      t.text    :token,     :null => false,   :limit => 2000
      t.boolean :private,   :default => false

      t.timestamps
    end

    add_index :links, [:user_id, :domain_id, :token], :unique => true
  end

  def self.down
    drop_table :links
  end
end

