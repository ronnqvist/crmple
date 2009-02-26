desc 'Creates an admin user'
task :create_admin => :environment do
  email_address = 'admin@localhost.com'
  
  if User.find_by_email(email_address).nil?
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
  else
    puts "Admin already exist!"
  end
end