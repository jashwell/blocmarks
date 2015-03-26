class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  has_many :likes, dependent: :destroy

  validates :user, presence: true
  validates :topic, presence: true
  validates :url, presence: true
end
