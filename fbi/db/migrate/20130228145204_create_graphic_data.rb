class CreateGraphicData < ActiveRecord::Migration
  def change
    create_table :graphic_data do |t|
      t.string :filename

      t.timestamps
    end
  end
end
