class AddUuidToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :uuid, :string
  end
end
