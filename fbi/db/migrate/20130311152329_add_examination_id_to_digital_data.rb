class AddExaminationIdToDigitalData < ActiveRecord::Migration
  def change
    add_column :digital_data, :examination_id, :int
  end
end
