class CreateCorrelations < ActiveRecord::Migration
  def change
    create_table :correlations do |t|

      t.timestamps
    end
  end
end
