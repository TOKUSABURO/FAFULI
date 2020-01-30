class Course < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :info_title, :info_details, :free_info_topics, :free_info_details,  presence: true
    validates :price, presence:true
    belongs_to :user
end
