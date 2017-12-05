class Residence < ActiveRecord::Base
  belongs_to :user
  belongs_to :polling_place

  def initialize(address:, is_primary:, user_id:)
    @address = address
    @is_primary = is_primary
    @user_id = user_id
    @polling_place_id = find_polling_place_id(address)
  end

  def get_district(address)
    #queries API for election district of residenceinstance.address and returns it
  end

  def find_polling_place_id(address)
    #runs get_district(address) and finds polling place with that district
    #returns its ID
  end

end
