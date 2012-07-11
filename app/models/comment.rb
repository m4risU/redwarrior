class Comment < ActiveRecord::Base
  attr_accessible :author, :content, :post_id
  belongs_to :post

  validates :author, :length => { :minimum => 3 }
  validates :content, :length => { :minimum => 5 }

end
