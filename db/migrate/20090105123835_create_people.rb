class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :firstname
      t.string :lastname
      t.string :nickname
      t.boolean :verified, :default => false
      t.date :approved_membership
      t.string :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
