class AddDataToCorrelations < ActiveRecord::Migration
  def change
    add_column :correlations, :data, :string
  end
end
