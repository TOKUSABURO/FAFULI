class AddFieldsToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :email, :string
    add_column :purchases, :description, :string
    add_column :purchases, :currency, :string
    add_column :purchases, :card, :string
    add_column :purchases, :user_id, :string
    add_column :purchases, :course_id, :string
  end
end
