class MyBad < ActiveRecord::Migration
  def change
  	rename_column :arguments, :args_id, :question_id
  end
end
