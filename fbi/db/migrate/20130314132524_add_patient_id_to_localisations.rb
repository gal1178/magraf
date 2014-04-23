class AddPatientIdToLocalisations < ActiveRecord::Migration
  def change
    add_column :localisations, :patient_id, :integer
  end
end
