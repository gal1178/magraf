# -*- encoding : utf-8 -*-
class AddIdpatientToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :idpatient, :integer
  end
end
