class AddFileNameToCorrelations < ActiveRecord::Migration
  def change
    add_column :correlations, :file_name, :string
  end
end
