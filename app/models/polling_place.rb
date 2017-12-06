class PollingPlace < ActiveRecord::Base
  has_many :reviews
  has_many :residences
  has_many :users, through: :residences


  def self.find_polling_place_by_district_number(district_number)
    self.all.find_by(district_key: district_number)
  end
  #These will be created by seeding database with api information.
end
