class PollingPlace < ActiveRecord::Base
  has_many :reviews
  has_many :residences
  has_many :users, through: :residences


  def self.find_polling_place_by_council_district(council_district)
    self.all.find_by(council_district: council_district)
  end
  #These will be created by seeding database with api information.
end
