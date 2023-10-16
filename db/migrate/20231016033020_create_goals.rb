class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.text :purpose,        null: false
      t.text :goal,           null: false
      t.text :action,         null: false
      t.date :deadline,       null: false
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
