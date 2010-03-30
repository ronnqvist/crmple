desc 'Changes password of user'
task :change_password => :environment do
  email_address = 'admin@localhost.com'  
  new_pass = '6CharP'

  if user = User.find_by_email(email_address)
    user.password = new_pass
    user.password_confirmation = new_pass
    user.save!
  end
end