class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string :email
      t.integer :ammount
      t.string :description
      t.string :currency
      t.string :card
      t.string :user_id
      t.string :course_id
      t.timestamps
    end
  end
end
