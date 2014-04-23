class AddDigitalDatumIdToCurrents < ActiveRecord::Migration
  def change
    add_column :currents, :digital_datum_id, :integer
  end
end
