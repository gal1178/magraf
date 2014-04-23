class AddExaminationIdToGraphic < ActiveRecord::Migration
  def change
    add_column :graphics, :examination_id, :integer
  end
end
