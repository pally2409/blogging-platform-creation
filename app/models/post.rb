class Post < ApplicationRecord

  belongs_to :user
  acts_as_commontable

  def self.search(search)
  where("title LIKE ? OR content LIKE ?", "%#{search}%", "%#{search}%")
end
end
