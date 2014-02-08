class CreateArgumnets < ActiveRecord::Migration
  def change
    create_table :argumnets do |t|
      t.integer :args_id
      t.string :body

      t.timestamps
    end
  end
end
