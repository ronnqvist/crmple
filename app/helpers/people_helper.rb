module PeopleHelper
  
  def checked_if_has_role(person, role)
    unless person.id.nil?
      person.has_role?(role) ? { :checked => true } : { :checked => false }
    else
      { :checked => false }
    end
  end
  
end
