class AddPersonToPayments < ActiveRecord::Migration
  def self.up
    add_column :payments, :person_id, :integer
  end

  def self.down
    remove_column :payments, :person_id
  end
end
