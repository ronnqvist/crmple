class CreatePhones < ActiveRecord::Migration
  def self.up
    create_table :phones do |t|
      t.references :person
      
      t.string :type
      t.string :number

      t.timestamps
    end
  end

  def self.down
    drop_table :phones
  end
end
