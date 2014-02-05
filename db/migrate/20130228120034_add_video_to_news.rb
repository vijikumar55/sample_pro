class AddVideoToNews < ActiveRecord::Migration
  def self.up
    add_attachment :news, :video1
  end

  def self.down
     remove_attachment :news, :video1
  end
end
