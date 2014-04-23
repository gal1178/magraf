class AddExaminationsIdToDigitalData < ActiveRecord::Migration
  def change
    add_column :digital_data, :examinations_id, :int
  end
end
