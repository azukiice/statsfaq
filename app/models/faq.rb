class Faq < ActiveRecord::Base

  def self.all_sports
    ["MLB","NBA","NFL","NHL","Golf","Tennis","Soccer","General"]
  end

end
