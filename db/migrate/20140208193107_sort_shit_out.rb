class SortShitOut < ActiveRecord::Migration
  def change
  	remove_column :arguments, :question_id

  	add_column :arguments, :votes, :integer
  end
end
