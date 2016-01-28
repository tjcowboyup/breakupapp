class AddMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :text, null: false
      t.boolean :spice, null: false
      t.string :section, null: false
      t.timestamps null: false
    end
  end
end
