class CreateNumericalData < ActiveRecord::Migration
  def change
    create_table :numerical_data do |t|
      t.string :filename

      t.timestamps
    end
  end
end
