module PeopleHelper
  
  def checked_if_has_role(person, role)
    unless person.id.nil?
      person.has_role?(role) ? { :checked => true } : { :checked => false }
    else
      { :checked => false }
    end
  end
  
  def fields_for_record(record, name, &block)
    prefix = record.new_record? ? 'new' : 'existing'
    fields_for("person[#{prefix}_#{name}_attributes][]", record, &block)
  end
end
