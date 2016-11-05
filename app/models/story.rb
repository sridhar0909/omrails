class Story < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :title, presence: true, length: { maximum: 100}
  validates :story, presence: true, length: { maximum: 500}
end 
 
