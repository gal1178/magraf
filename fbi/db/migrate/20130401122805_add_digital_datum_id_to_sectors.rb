class AddDigitalDatumIdToSectors < ActiveRecord::Migration
  def change
    add_column :sectors, :digital_datum_id, :integer
  end
end
