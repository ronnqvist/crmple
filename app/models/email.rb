class Email < ActiveRecord::Base
  belongs_to :person
  
  # Validations
  validates_presence_of :email
end
