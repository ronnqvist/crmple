require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  
  def test_should_create_person
    assert_difference 'Person.count' do
      person = create_person
      assert !person.new_record?, "#{person.errors.full_messages.to_sentence}"
    end
  end
  
  def test_should_require_lastname
    assert_no_difference 'Person.count' do
      person = create_person(:lastname => nil)
      assert person.errors.on(:lastname)
    end
  end
  
  def test_should_require_firstname
    assert_no_difference 'Person.count' do
      person = create_person(:firstname => nil)
      assert person.errors.on(:firstname)
    end
  end
  
  def test_should_require_nickname
    assert_no_difference 'Person.count' do
      person = create_person(:nickname => nil)
      assert person.errors.on(:nickname)
    end
  end
  
  def test_should_assign_roles
    assert_difference 'Person.count' do
      person = create_person
      [roles(:one), roles(:two)].each { |role| person.roles << role }
      assert_equal 2, person.roles.size
    end
  end
  
  private
  
  def create_person(options = {})
    person = Person.new({ :firstname => 'simo', :lastname => 'nieme', :nickname => 'sniemela', :comments => 'asdasd' }.merge(options))
    person.save
    person
  end
end
