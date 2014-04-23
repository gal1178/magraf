# -*- encoding : utf-8 -*-
class AddArchiveToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :archive, :string

  end
end
