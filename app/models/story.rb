class Story < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :title, presence: true, length: { maximum: 200}
  validates :story, presence: true, length: { maximum: 10000}

  acts_as_votable

end 
 
