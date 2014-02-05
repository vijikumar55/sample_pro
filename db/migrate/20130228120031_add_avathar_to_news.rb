class AddAvatharToNews < ActiveRecord::Migration
  def self.up
    add_column :news, :avathar, :string
  end

  def self.down
    remove_column :news, :avathar
  end
end
