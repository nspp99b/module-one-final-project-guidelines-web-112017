class CreatePollingPlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :polling_places do |t|
      t.string :name
      t.string :address
    end
  end
end
