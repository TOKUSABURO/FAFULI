class Comment < ApplicationRecord
    belongs_to :course
    belongs_to :user

    validates :content, presence: true, length: { minimum: 2}

  

end
