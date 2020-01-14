class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.references :conversation, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :read, null: false, default: false

      t.timestamps null: false
    end
  end
end
