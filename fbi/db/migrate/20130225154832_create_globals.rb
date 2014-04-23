class CreateGlobals < ActiveRecord::Migration
  def change
    create_table :globals do |t|

      t.timestamps
    end
  end
end
