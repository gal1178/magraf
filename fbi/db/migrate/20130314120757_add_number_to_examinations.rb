class AddNumberToExaminations < ActiveRecord::Migration
  def change
    add_column :examinations, :number, :string
  end
end
