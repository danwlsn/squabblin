class RemoveDoubleTable < ActiveRecord::Migration
  def change
  	drop_table :argumnets
  end
end
