class Article < ApplicationRecord
  include Discard::Model
  has_many :comments

  validates :title, presence: true, length: { minimum: 5 }

  scope :undiscarded, -> { where(discarded_at: nil) }

end
