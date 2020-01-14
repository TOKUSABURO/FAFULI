class RemoveReferenceCommentFromCourses < ActiveRecord::Migration[6.0]
  def change
    remove_reference :courses, :comment, null: false, foreign_key: true
    
  end
end
