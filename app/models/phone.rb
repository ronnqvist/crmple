class Phone < ActiveRecord::Base
  belongs_to :person
  
  validates_presence_of :number
end
