class AddDigitalDatumIdToCorrelations < ActiveRecord::Migration
  def change
    add_column :correlations, :digital_datum_id, :integer
  end
end
