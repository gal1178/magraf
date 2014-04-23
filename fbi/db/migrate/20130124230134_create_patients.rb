# -*- encoding : utf-8 -*-
class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.integer :id
      t.date :date

      t.timestamps
    end
  end
end
