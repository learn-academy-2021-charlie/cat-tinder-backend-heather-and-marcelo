class CreateTurtles < ActiveRecord::Migration[6.1]
  def change
    create_table :turtles do |t|
      t.string :name
      t.integer :age
      t.text :enjoys

      t.timestamps
    end
  end
end
