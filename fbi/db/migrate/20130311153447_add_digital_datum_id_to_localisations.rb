class AddDigitalDatumIdToLocalisations < ActiveRecord::Migration
  def change
    add_column :localisations, :digital_datum_id, :int
  end
end
