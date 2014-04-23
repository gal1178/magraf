class AddDigitalDataIdToLocalisations < ActiveRecord::Migration
  def change
    add_column :localisations, :digital_data_id, :int
  end
end
