class AddDataToIntegrals < ActiveRecord::Migration
  def change
    add_column :integrals, :data, :string
  end
end
