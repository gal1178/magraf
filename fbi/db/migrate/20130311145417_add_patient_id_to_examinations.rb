class AddPatientIdToExaminations < ActiveRecord::Migration
  def change
    add_column :examinations, :patient_id, :int
  end
end
