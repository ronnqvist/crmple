class Person < ActiveRecord::Base
  has_many :role_assignments
  has_many :roles, :through => :role_assignments
  has_many :addresses
  has_many :phones
  has_many :emails
  def role_attributes=(attributes)
    attributes.each do |attribute|
      roles.build(attribute)
    end
  end 
end
