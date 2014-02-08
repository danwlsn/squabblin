class DefaltValue < ActiveRecord::Migration
  def change
  	change_column :arguments, :votes, :integer, default: 0
  end
end
