class AddRelatedImagesToNews < ActiveRecord::Migration
  def self.up
    add_column :news, :related_image, :string
  end

  def self.down
    remove_column :news, :related_image
  end
end
