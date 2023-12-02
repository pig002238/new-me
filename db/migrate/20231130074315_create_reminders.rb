class CreateReminders < ActiveRecord::Migration[7.0]
  def change
    create_table :reminders do |t|
      t.references :user,     null: false, foreign_key: true
      t.references :post,     null: false, foreign_key: true
      t.text :message
      t.datetime :remind_at
      t.timestamps
    end
  end
end
