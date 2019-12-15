class Post < ApplicationRecord
  acts_as_taggable

  validates :title, presence: true, length: { maximum:140 }
  validates :url, presence: true, length: { maximum: 140 }
  validates :reference, presence: true, length: { maximum: 140 }
end
