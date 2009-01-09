module PeopleHelper
  def checked_if_has_role(person, role)
    person.roles.include?(role) ? { :checked => true } : { :checked => false }
  end
end
