class PollingPlace < ActiveRecord::Base
  has_many :reviews
  has_many :residences
  has_many :users, through: :residences
end
