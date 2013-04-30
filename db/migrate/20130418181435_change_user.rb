class ChangeUser < ActiveRecord::Migration
  change_column :Users, :name, :string, :default => "onetwothree", :length => {:maximum => 20}
  change_column :Users, :email, :string, :default => "test", :length => {:maximum => 120}
  def up
  end

  def down
  end
end
