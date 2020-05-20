class Comment < ApplicationRecord
  include Discard::Model

  belongs_to :article
  before_save :equivalent_value_comment

  scope :kept, -> { undiscarded.joins(:article).merge(Article.kept) }

  def kept?
    undiscarded? && Article.kept?
  end

  # Never read the comments.
  def equivalent_value_comment
    new_body = ""
    (self.body.length / 5).times do
      new_body << (rand(2) > 0 ? "herp " : "derp ")
    end
    self.body = new_body.rstrip
  end

end
