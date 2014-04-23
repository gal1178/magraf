class AddFilenameToGraphic < ActiveRecord::Migration
  def change
    add_column :graphics, :filename, :string
  end
end
