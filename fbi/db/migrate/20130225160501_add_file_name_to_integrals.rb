class AddFileNameToIntegrals < ActiveRecord::Migration
  def change
    add_column :integrals, :file_name, :string
  end
end
