require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  
  def test_should_create_role
    assert_difference 'Role.count' do
      role = Role.new(:name => roles(:one).name, :comments => roles(:one).comments)
      assert role.save
      assert !role.new_record?
    end
  end
end
