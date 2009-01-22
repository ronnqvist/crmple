class Email < ActiveRecord::Base
  belongs_to :person
  
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
            # Is this one better?     /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i

                          # Should also accept empty
                          # Doesn't show any message when editing, only when creating new
  
  def self.for_newsletter
    find(:all, :conditions => ['receive_newsletters = ?', true])
  end
end
