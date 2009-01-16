class Address < ActiveRecord::Base
  belongs_to :person
  
  def post_office_line # The line where post office occurs, in european format: XX-12345 Postal office
    unless self.country_code.empty?
      country_code_prefix = self.country_code + '-'
    else
      country_code_prefix = ''
    end
    post_office_line = country_code_prefix + self.postal_code.to_s + ' ' + self.post_office
  end
end
