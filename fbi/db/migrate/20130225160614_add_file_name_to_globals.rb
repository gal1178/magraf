class AddFileNameToGlobals < ActiveRecord::Migration
  def change
    add_column :globals, :file_name, :string
  end
end
