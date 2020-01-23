class RemoveRatesFromCourses < ActiveRecord::Migration[6.0]
  def change

    remove_column :courses, :rates, :integer
  end
end
