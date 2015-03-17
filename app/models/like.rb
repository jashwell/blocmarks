class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :bookmark

  validates :bookmark, presence: true
  validates :user, presence: true
end
