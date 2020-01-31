class CreateTable < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string :email
      t.string :description
      t.string :currency
      t.string :card
      t.integer :user_id
      t.integer :course_id
      t.integer :ammount
      t.string :uuid
      t.timestamps
    end
  end
end
