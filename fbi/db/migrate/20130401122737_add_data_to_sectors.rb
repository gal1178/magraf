class AddDataToSectors < ActiveRecord::Migration
  def change
    add_column :sectors, :data, :string
  end
end
