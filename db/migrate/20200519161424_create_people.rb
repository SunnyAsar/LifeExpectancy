class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.integer :age, null: false
      t.decimal :death_probability, null: false
      t.integer :number_of_lives, null: false
      t.decimal :life_expectancy, null: false
      t.integer :gender, null: false

      t.timestamps
    end
  end
end
