# -*- encoding : utf-8 -*-
class CreateArchives < ActiveRecord::Migration
  def change
    create_table :archives do |t|
      t.integer :id

      t.timestamps
    end
  end
end
