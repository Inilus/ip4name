class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.references  :user,      :null => false
      t.string      :provider,  :null => false
      t.string      :uid
      t.string      :uname
      t.string      :uemail

      t.timestamps
    end
  end

  def self.down
    drop_table :services
  end
end

