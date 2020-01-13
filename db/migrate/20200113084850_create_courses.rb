class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :info_title
      t.string :info_details
      t.string :free_info_topics
      t.string :free_info_details
      t.integer :price

      t.timestamps
    end
  end
end
