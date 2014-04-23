class AddCommentToExaminations < ActiveRecord::Migration
  def change
    add_column :examinations, :comment, :string
  end
end
