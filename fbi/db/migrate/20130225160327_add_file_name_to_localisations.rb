class AddFileNameToLocalisations < ActiveRecord::Migration
  def change
    add_column :localisations, :file_name, :string
  end
end
