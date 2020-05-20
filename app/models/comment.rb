class Comment < ApplicationRecord
  belongs_to :article
  
  before_save :equivalent_value_comment
  before_validation :set_finished_at
  after_save :check_finished_at

  # Never read the comments.
  def equivalent_value_comment
    new_body = ""
    (self.body.length / 5).times do
      new_body << (rand(2) > 0 ? "herp " : "derp ")
    end
    self.body = new_body.rstrip
  end

  def set_finished_at
    self.finished_at = Time.now
  end

  def check_finished_at
    puts "Does after_save think we changed our finished_at? #{saved_change_to_finished_at?}"
  end

end
