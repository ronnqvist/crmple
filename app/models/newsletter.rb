class Newsletter < ActiveRecord::Base
  
  # Takes an array of ids like selected_roles => ["1", "3"]
  def self.subscribers(roles, options = {})
    roles = Role.find(roles.reject(&:empty?), :include => :people)
    subscribers = roles.inject([]) do |emails, role|
      emails << role.people.subscribers.map(&:email)
      emails
    end
    subscribers.flatten.uniq.join(options[:separator] || ', ')
  end
end
