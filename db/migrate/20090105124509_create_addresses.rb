class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.references :person
      
      t.string :type
      t.string :street
      t.string :country_code
      t.integer :postal_code
      t.string :post_office
      t.string :country

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
