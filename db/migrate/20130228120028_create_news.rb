class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.string :title
      t.string :published_date
      t.string :author_name 
      t.timestamps
    end
  end

  def self.down
    drop_table :news
  end
end
