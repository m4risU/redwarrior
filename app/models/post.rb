class Post < ActiveRecord::Base
  attr_accessible :author, :content, :title
  has_many :comments

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
end
