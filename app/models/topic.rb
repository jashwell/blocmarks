class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :bookmarks

  validates :user, presence: true
end
