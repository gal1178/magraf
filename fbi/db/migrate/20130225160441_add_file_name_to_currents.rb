class AddFileNameToCurrents < ActiveRecord::Migration
  def change
    add_column :currents, :file_name, :string
  end
end
