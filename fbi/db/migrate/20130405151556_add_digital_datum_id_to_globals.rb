class AddDigitalDatumIdToGlobals < ActiveRecord::Migration
  def change
    add_column :globals, :digital_datum_id, :integer
  end
end
