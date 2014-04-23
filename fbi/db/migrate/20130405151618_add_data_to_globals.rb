class AddDataToGlobals < ActiveRecord::Migration
  def change
    add_column :globals, :data, :string
  end
end
