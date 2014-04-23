class CreateLocalisations < ActiveRecord::Migration
  def change
    create_table :localisations do |t|

      t.timestamps
    end
  end
end
