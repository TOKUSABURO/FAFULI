class Purchase < ApplicationRecord
    belongs_to :user
    belongs_to :course
    def to_param
        uuid
    end
end
