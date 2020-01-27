class RemoveRateFromComments < ActiveRecord::Migration[6.0]
  def change

    remove_column :comments, :rate, :integer
  end
end
