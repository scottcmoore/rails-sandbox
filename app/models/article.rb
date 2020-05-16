class Article < ApplicationRecord
  include Discard::Model

  validates :title, presence: true, length: { minimum: 5 }

  scope :undiscarded, -> { where(discarded_at: nil) }

end
