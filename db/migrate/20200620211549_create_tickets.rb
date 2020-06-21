class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.string :ticket_token
      t.boolean :isClose, default: false
      t.timestamps
    end
  end
end
