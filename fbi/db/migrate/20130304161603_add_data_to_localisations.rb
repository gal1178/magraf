class AddDataToLocalisations < ActiveRecord::Migration
  def change
    add_column :localisations, :data, :string
  end
end
