class Person < ActiveRecord::Base
  has_many :role_assignments
  has_many :roles, :through => :role_assignments
  has_many :addresses
  has_many :phones
  has_many :emails
  
  # User validations
  validates_presence_of :firstname, :lastname, :nickname
  
  # Assigns user to roles
  def roles=(role_attributes)
    role_attributes.each do |id, attribute|
      role = Role.find(id)
      unless attribute['name'].empty?
        roles << role unless roles.include?(role)
      else
        roles.delete(role) if roles.include?(role)
      end
    end
  end
  
  def full_name
    "#{self.firstname} #{self.lastname}"
  end

  def lastname_firstname
    "#{self.lastname}, #{self.firstname}"
  end
end
