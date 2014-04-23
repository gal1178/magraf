class AddDataToCurrents < ActiveRecord::Migration
  def change
    add_column :currents, :data, :string
  end
end
