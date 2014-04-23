class CreateDigitalData < ActiveRecord::Migration
  def change
    create_table :digital_data do |t|
      t.string :filename

      t.timestamps
    end
  end
end
