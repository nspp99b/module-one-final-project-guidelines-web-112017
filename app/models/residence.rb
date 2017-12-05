class Residence < ActiveRecord::Base
  belongs_to :user
  belongs_to :polling_place

  def get_district
    #uses self.address to get district
    #queries API for election district of residenceinstance.address and returns it
  end

  def find_polling_place_id
    #runs get_district(address) and finds polling place with that district
    #returns its ID
    #uses self.address to get polling place_id
    self.polling_place_id = 1
    self.save
  end

end
