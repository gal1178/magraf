class AddCartNameToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :cart_name, :string
  end
end
