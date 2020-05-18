class Article < ApplicationRecord
  include Discard::Model
  # Since we only soft delete articles, Article#destroy never gets called.
  # As a result cleaning up comments on discarded articles is handled by
  # the Comment kept scope, per the discard gem docs. As a result, no
  # dependent: :destroy is used here.
  has_many :comments

  validates :title, presence: true, length: { minimum: 5 }

  scope :undiscarded, -> { where(discarded_at: nil) }

end
