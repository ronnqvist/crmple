class Newsletter < ActiveRecord::Base
  def self.subscribers(roles)
    ["testi", "testi2", "testi3"].join(', ')
  end
end
