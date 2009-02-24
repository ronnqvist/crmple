class Person < ActiveRecord::Base
  extend ActiveSupport::Memoizable
  
  has_many :role_assignments, :dependent => :delete_all
  has_many :roles, :through => :role_assignments
  has_many :addresses
  has_many :phones
  has_many :emails
  has_many :payments
  
  has_one :user
  
  # User validations
  validates_presence_of :firstname, :lastname
  
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
  
  # Generates called methods automatically.
  class_eval do
    ['emails', 'phones', 'addresses'].each do |association|
      variable = association.singularize
      eval <<-EOM
        def new_#{variable}_attributes=(#{variable}_attributes)
          #{variable}_attributes.each do |attributes|
            #{association}.build(attributes)
          end
        end
        
        def existing_#{variable}_attributes=(#{variable}_attributes)
          #{association}.reject(&:new_record?).each do |#{variable}|
            attributes = #{variable}_attributes[#{variable}.id.to_s]
            if attributes
              #{variable}.attributes = attributes
              #{variable}.save
            else
              #{association}.delete(#{variable})
            end
          end
        end
      EOM
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
  
  def newsletter_emails
    emails.for_newsletter.map(&:email)
  end
  
  def self.subscribers
    self.all(:include => :emails).inject([]) do |emails, person|
      emails << person.emails.for_newsletter
      emails.flatten
    end
  end
  
  memoize :has_role?, :full_name, :lastname_firstname
end
