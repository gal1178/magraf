class AddDigitalDatumIdToIntegrals < ActiveRecord::Migration
  def change
    add_column :integrals, :digital_datum_id, :integer
  end
end
