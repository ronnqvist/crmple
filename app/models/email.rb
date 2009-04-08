class Email < ActiveRecord::Base
  belongs_to :person
  
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                              :if => Proc.new { |e| !e.email.blank? }
            # Is this one better?     /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i

                          # Should also accept empty
                          # Doesn't show any message when editing, only when creating new
  validates_uniqueness_of :email
  
  def self.for_newsletter
    find(:all, :conditions => ['receive_newsletters = ? AND email != ?', true, ''])
  end
end
