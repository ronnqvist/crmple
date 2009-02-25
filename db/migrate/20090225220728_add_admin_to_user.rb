class AddAdminToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :admin, :boolean, :default => false
    
    # Create default admin user
    email_address = 'admin@localhost.com'
    
    person                     = Person.new
    person.firstname           = 'Admin'
    person.lastname            = 'User'
    person.comments            = ''
    person.save
    person.emails.create!(:email => email_address)
    
    user                       = User.new
    user.login                 = 'admin'
    user.email                 = email_address
    user.password              = 'admin'
    user.password_confirmation = 'admin'
    user.admin                 = true
    user.save
    user.activate!
  end

  def self.down
    remove_column :users, :admin
  end
end
