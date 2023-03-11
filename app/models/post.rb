class Post < ApplicationRecord
    belongs_to :user
    has_many :comments 
    has_many :likes, dependent: :destroy
    has_one_attached :image

    validates :image, presence: true
    validates :title, presence: true
    validates :body, presence: true
    validates :image, file_size: { less_than_or_equal_to: 2.megabytes },
              file_content_type: { allow: ['image/jpeg', 'image/png'] }
end
