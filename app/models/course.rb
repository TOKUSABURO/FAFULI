class Course < ApplicationRecord
    has_many :comments, dependent: :destroy



    validates :info_title, :info_details, :free_info_topics, :free_info_details,  presence: true, length: { minimum: 5}

   
    validates :info_title, :info_details, :free_info_topics, :free_info_details,  format: { with: /\A[a-zA-Z'-]*\z/ }, length: { maximum: 25}
  validates :price, presence:true
   


    belongs_to :user

end
