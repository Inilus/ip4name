class CreateDomains < ActiveRecord::Migration
  def self.up
    create_table :domains do |t|
      t.string :url

      t.timestamps
    end

    add_index :domains, :url, :unique => true
  end

  def self.down
    drop_table :domains
  end
end

