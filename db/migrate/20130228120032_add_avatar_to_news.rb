class AddAvatarToNews < ActiveRecord::Migration
  def self.up
    add_column :news, :avatar, :string
  end

  def self.down
    remove_column :news, :avatar
  end
end
