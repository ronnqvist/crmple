class Person < ActiveRecord::Base
  has_many :role_assignments
  has_many :roles, :through => :role_assignments
  has_many :addresses
  has_many :phones
  has_many :emails
  
  # User validations
  validates_presence_of :firstname, :lastname, :nickname
  
  # Assigns user to roles
  def roles=(attributes)
    attributes.each do |id, value|
      self.roles << Role.find(id) unless value['name'].empty?
    end
  end
  
  def full_name
    "#{self.firstname} #{self.lastname}"
  end
end
