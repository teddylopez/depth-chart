class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :last_name
      t.string :first_name
      t.string :photo
      t.integer :age
      t.integer :position
      t.integer :bats
      t.integer :throws
      t.integer :current_year_salary
      t.integer :free_agent_year

      t.timestamps
    end
  end
end
