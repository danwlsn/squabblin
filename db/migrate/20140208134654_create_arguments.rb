class CreateArguments < ActiveRecord::Migration
  def change
    create_table :arguments do |t|
      t.string :slug
      t.string :title
      t.integer :args_a
      t.integer :args_b

      t.timestamps
    end
  end
end
