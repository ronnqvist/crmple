class Role < ActiveRecord::Base
  has_many :role_assignments
  has_many :people, :through => :role_assignments
end
