class AddSentMessages < ActiveRecord::Migration
  def change
    create_table :sent_messages do |t|
      t.integer :intro
      t.integer :body
      t.integer :end
      t.timestamps null: false
    end

    # to track what entries were used for each message's intro, body and end
    # FK used to maintain referential integrity, custom column names for human readability
    add_foreign_key :sent_messages, :messages, column: :intro, primary_key: "id"
    add_foreign_key :sent_messages, :messages, column: :body, primary_key: "id"
    add_foreign_key :sent_messages, :messages, column: :end, primary_key: "id"
  end
end
