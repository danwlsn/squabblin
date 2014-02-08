class CreateArguments < ActiveRecord::Migration
  def change
    create_table :arguments do |t|
      t.integer :args_id
      t.string :text

      t.timestamps
    end
  end
end
