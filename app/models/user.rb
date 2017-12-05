class User < ActiveRecord::Base
  has_many :reviews
  has_many :residences
  has_many :polling_places, through: :residences

  #A user will be solely responsible for creating reviews
  def create_review(title:, message:, wait_time:, service:)
    new_review = Review.create(title: title, message: message, wait_time: wait_time, service: service, user_id: self.id, polling_place_id: self.find_current_polling_place)
  end
  #A user will be solely responsible for creating residences
  def create_residence(address:, :is_primary)
    new_residence = Residence.create(address: address, is_primary: is_primary, user_id: self.id)
  end
  #A user can have many residences, but polling_place must be determined by primary only
  def primary_residence
    self.residences.where("is_primary = ?", true)
  end

  def find_current_polling_place
    self.primary_residence.polling_place.id
  end

end
