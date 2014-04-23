class CreateIntegrals < ActiveRecord::Migration
  def change
    create_table :integrals do |t|

      t.timestamps
    end
  end
end
