class AddQrCodeToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :qrcode_id, :integer
    
  end

  def self.down
    remove_column :qrcode_id
  end
end
