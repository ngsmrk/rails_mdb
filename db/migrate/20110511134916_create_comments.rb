class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :text
      t.integer :film_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
