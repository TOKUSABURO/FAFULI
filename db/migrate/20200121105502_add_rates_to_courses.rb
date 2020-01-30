class AddRatesToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :rates, :integer
  end
end
