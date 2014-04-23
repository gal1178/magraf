class AddFileNameToSectors < ActiveRecord::Migration
  def change
    add_column :sectors, :file_name, :string
  end
end
