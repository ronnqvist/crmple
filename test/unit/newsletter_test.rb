require 'test_helper'

class NewsletterTest < ActiveSupport::TestCase
  
  def test_should_create_email_list
    roles = [roles(:one).id.to_s, "", ""]
    emails = Newsletter.subscribers(roles)
    assert_equal 'paavo.suominen@gmail.com', emails
  end
  
  def test_should_remove_duplicated_emails
    # Empty strings for testing purpose
    roles = [roles(:one).id.to_s, roles(:two).id.to_s, "", ""]
    emails = Newsletter.subscribers(roles)
    assert_equal 'paavo.suominen@gmail.com, matti.meikalainen@gmail.com', emails
  end
  
  def test_should_add_separator
    roles = [roles(:one).id.to_s, roles(:two).id.to_s, "", ""]
    emails = Newsletter.subscribers(roles, :separator => '; ')
    assert_equal 'paavo.suominen@gmail.com; matti.meikalainen@gmail.com', emails
  end
end
