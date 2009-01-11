class Person < ActiveRecord::Base
  extend ActiveSupport::Memoizable
  
  has_many :role_assignments
  has_many :roles, :through => :role_assignments
  has_many :addresses
  has_many :phones
  has_many :emails
  
  # User validations
  validates_presence_of :firstname, :lastname, :nickname
  validates_associated :emails
  
  # Assigns role to user
  def roles=(role_attributes)
    role_attributes.each do |id, attribute|
      role = Role.find(id)
      unless attribute['name'].empty?
        roles << role unless has_role?(role)
      else
        roles.delete(role) if has_role?(role)
      end
    end
  end
  
  def new_email_attributes=(email_attributes)
    email_attributes.each do |attributes|
      emails.build(attributes)
    end
  end
  
  def existing_email_attributes=(email_attributes)
    emails.reject(&:new_record?).each do |email|
      attributes = email_attributes[email.id.to_s]
      if attributes
        email.attributes = attributes
        email.save
      else
        emails.delete(email)
      end
    end
  end
  
  def has_role?(role)
    roles.include?(role)
  end
  
  def full_name
    "#{self.firstname} #{self.lastname}"
  end

  def lastname_firstname
    "#{self.lastname}, #{self.firstname}"
  end
  
  memoize :has_role?, :full_name, :lastname_firstname
end
